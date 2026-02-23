// tool/gen_levels.dart
import 'dart:collection';
import 'dart:io';
import 'dart:math';

/// ============================================================================
/// FLOW v3.4 — Générateur STABLE (évite le ramage dès 6x6)
/// dart run tool/gen_levels.dart
/// Objectifs:
/// - Niveaux toujours solvables (BFS robuste, + option “drunk walk” pour variété)
/// - Endpoints jamais adjacents (distance manhattan >= 2)
/// - FullFill = DÉDUIT de la solution (pas tiré au hasard)
/// - Anti-doublons robuste : pairs + blocked + min sur 8 symétries
///
/// Changements clés vs v3.3:
/// - Sur 6x6+ : on évite les obstacles (taux d’échec énorme sinon)
/// - On choisit D’ABORD toutes les paires d’endpoints, puis on route
///   les plus longues en premier (réduit fortement les situations “grille coupée”)
/// - Sur 6x6+ : BFS d’abord (rapide + stable), puis petite touche “drunk” si besoin
/// - Budget/attempts raisonnables + logs de progression
/// ============================================================================

class PairDef {
  final int colorId;
  final Point<int> a;
  final Point<int> b;
  const PairDef(this.colorId, this.a, this.b);
}

class LevelDef {
  final int size;
  final List<PairDef> pairs;
  final Set<Point<int>> blocked;
  final bool requireFullFill;
  final Map<int, List<Point<int>>> solution;

  const LevelDef(
    this.size,
    this.pairs,
    this.solution, {
    required this.blocked,
    required this.requireFullFill,
  });
}

class Stage {
  final int size;
  final int colorsMin;
  final int colorsMax;
  final int count;
  final double spice;

  /// 0..1 : “préférence” de fullfill (soft target)
  final double fullFillTarget;

  const Stage({
    required this.size,
    required this.colorsMin,
    required this.colorsMax,
    required this.count,
    required this.spice,
    required this.fullFillTarget,
  });
}

const int kMasterSeed = 42;

final stages = <Stage>[
  Stage(
    size: 3,
    colorsMin: 2,
    colorsMax: 3,
    count: 4,
    spice: 0.10,
    fullFillTarget: 0.0,
  ),
  Stage(
    size: 4,
    colorsMin: 3,
    colorsMax: 5,
    count: 22,
    spice: 0.28,
    fullFillTarget: 0.0,
  ),
  Stage(
    size: 5,
    colorsMin: 3,
    colorsMax: 5,
    count: 40,
    spice: 0.38,
    fullFillTarget: 0.15,
  ),
  Stage(
    size: 6,
    colorsMin: 4,
    colorsMax: 6,
    count: 45,
    spice: 0.65,
    fullFillTarget: 0.0,
  ),
  Stage(
    size: 7,
    colorsMin: 5,
    colorsMax: 7,
    count: 50,
    spice: 0.82,
    fullFillTarget: 0.0,
  ),
  Stage(
    size: 8,
    colorsMin: 6,
    colorsMax: 8,
    count: 54,
    spice: 0.98,
    fullFillTarget: 0.0,
  ),
];

void main() {
  final masterRng = Random(kMasterSeed);
  final all = <LevelDef>[];
  final seenFingerprints = <String>{};

  final totalTarget = stages.fold<int>(0, (s, st) => s + st.count);
  stdout.writeln(
    "=== FLOW GEN v3.4 target=$totalTarget masterSeed=$kMasterSeed ===",
  );

  for (final st in stages) {
    stdout.writeln(
      "-> stage size=${st.size} count=${st.count} targetFull=${st.fullFillTarget.toStringAsFixed(2)}",
    );

    int made = 0;
    int dupRejected = 0;
    int printed = 0;

    final levelSeedBase = masterRng.nextInt(1 << 30);

    // Budget d'essais par stage (plus haut sur petites tailles)
    final budget = switch (st.size) {
      3 => st.count * 2000,
      4 => st.count * 1200,
      5 => st.count * 900,
      _ => st.count * 900,
    };

    for (int i = 0; i < budget && made < st.count; i++) {
      if (i % 500 == 0 && made < st.count && i > 0) {
        stdout.writeln(
          "  ... size=${st.size} tries=$i made=$made dup=$dupRejected",
        );
      }

      final levelRng = Random(levelSeedBase + i * 997 + st.size * 10007);
      final result = _generateOneLevel(levelRng, st);
      if (result == null) continue;

      final (level, fp) = result;
      if (seenFingerprints.contains(fp)) {
        dupRejected++;
        continue;
      }

      seenFingerprints.add(fp);
      all.add(level);
      made++;

      if (st.count >= 20 && made >= printed + 5) {
        printed = made;
        stdout.writeln(
          "  ... size=${st.size} $made/${st.count} (dup=$dupRejected)",
        );
      }
    }

    if (made < st.count) {
      stdout.writeln(
        "⚠️ Stage size=${st.size} incomplet: $made/${st.count}. Contraintes trop dures / budget insuffisant.",
      );
    }

    stdout.writeln(
      "size=${st.size} -> +$made niveaux, $dupRejected doublons rejetés (total ${all.length}/$totalTarget)",
    );
  }

  _writeLevelsDart(all);
  stdout.writeln("\n✅ ${all.length} niveaux → lib/game/data/levels.dart");
}

/// ============================================================================
/// Génération d'un niveau
/// - fullfill DÉDUIT
/// - endpoints choisis d’abord, routing des plus longues d’abord
/// ============================================================================
(LevelDef, String)? _generateOneLevel(Random rng, Stage st) {
  final n = st.size;
  final spice = st.spice.clamp(0.0, 1.0);

  // Moins d'essais quand on ne force pas le fullfill
  final baseAttempts = st.fullFillTarget <= 0 ? 220 : 520;
  final extra = (st.fullFillTarget * 350).round();
  final maxAttempts = baseAttempts + extra;

  bool preferFullFillNow(int attempt) {
    if (st.fullFillTarget <= 0) return false;
    final t = attempt / maxAttempts;
    if (t > 0.60) return false;
    return rng.nextDouble() < st.fullFillTarget;
  }

  for (int attempt = 0; attempt < maxAttempts; attempt++) {
    final blocked = _genBlocked(rng, n, spice);

    final freeCells = n * n - blocked.length;
    if (freeCells < 8) continue;

    // Heuristique faisabilité (disjoint + détours)
    final maxColorsFeasible = (freeCells / 3).floor().clamp(2, 10);

    final kRaw = _randInt(rng, st.colorsMin, st.colorsMax);
    final k = kRaw
        .clamp(st.colorsMin, min(st.colorsMax, maxColorsFeasible))
        .toInt();
    if (k < 2) continue;

    // 1) Choisir toutes les paires d'endpoints d’abord
    final reserved = <Point<int>>{...blocked};
    final endpoints = <(Point<int>, Point<int>)>[];

    bool endpointsOk = true;
    for (int cid = 0; cid < k; cid++) {
      final ep = _pickEndpoints(rng, n, reserved, minDist: _minEndpointDist(n));
      if (ep == null) {
        endpointsOk = false;
        break;
      }

      final (a, b) = ep;
      final man = (a.x - b.x).abs() + (a.y - b.y).abs();
      if (man < 2) {
        endpointsOk = false;
        break;
      }

      reserved.add(a);
      reserved.add(b);
      endpoints.add((a, b));
    }
    if (!endpointsOk) continue;

    // 2) Router les plus longues d'abord
    final order = List.generate(k, (i) => i);
    order.sort((i, j) {
      final (ai, bi) = endpoints[i];
      final (aj, bj) = endpoints[j];
      final di = (ai.x - bi.x).abs() + (ai.y - bi.y).abs();
      final dj = (aj.x - bj.x).abs() + (aj.y - bj.y).abs();
      return dj.compareTo(di);
    });

    // 3) Pose des chemins disjoints
    final used = <Point<int>>{...blocked};
    for (final (a, b) in endpoints) {
      used.add(a);
      used.add(b);
    }

    final pairs = <PairDef>[];
    final solution = <int, List<Point<int>>>{};
    bool ok = true;

    for (final idx in order) {
      final (a, b) = endpoints[idx];
      final usedForPath = used.difference({a, b});

      List<Point<int>>? path;

      // Sur 6x6+ : BFS d’abord (stable), puis petit “drunk” si on veut varier
      if (n >= 6) {
        path = _bfsPath(n, a, b, usedForPath);
        if (path == null) {
          // backup (rare)
          path = _drunkWalkPath(rng, n, a, b, usedForPath, spice: spice);
        } else {
          // si BFS trop court, on tente 1-2 walks pour rajouter un peu de forme
          if (path.length <= ((a.x - b.x).abs() + (a.y - b.y).abs()) + 1 &&
              rng.nextDouble() < 0.35) {
            final alt = _drunkWalkPath(rng, n, a, b, usedForPath, spice: spice);
            if (alt != null) path = alt;
          }
        }
      } else {
        path = _drunkWalkPath(rng, n, a, b, usedForPath, spice: spice);
        path ??= _bfsPath(n, a, b, usedForPath);
      }

      if (path == null || !_pathIsValid(path)) {
        ok = false;
        break;
      }

      final colorId = idx;
      pairs.add(PairDef(colorId, a, b));
      solution[colorId] = path;
      used.addAll(path);
    }

    if (!ok) continue;

    final isFullFill = _isFullFill(n, blocked, solution);
    if (preferFullFillNow(attempt) && !isFullFill) continue;

    final level = LevelDef(
      n,
      pairs,
      solution,
      blocked: blocked,
      requireFullFill: isFullFill,
    );

    return (level, _fingerprint(level));
  }

  return null;
}

bool _isFullFill(
  int n,
  Set<Point<int>> blocked,
  Map<int, List<Point<int>>> solution,
) {
  final covered = <Point<int>>{};
  for (final seg in solution.values) {
    covered.addAll(seg);
  }

  int freeCount = 0;
  for (int y = 0; y < n; y++) {
    for (int x = 0; x < n; x++) {
      if (!blocked.contains(Point<int>(x, y))) freeCount++;
    }
  }
  return covered.length == freeCount;
}

/// ============================================================================
/// DRUNK WALK (quelques essais) + fallback BFS
/// ============================================================================
List<Point<int>>? _drunkWalkPath(
  Random rng,
  int n,
  Point<int> start,
  Point<int> goal,
  Set<Point<int>> globalUsed, {
  required double spice,
}) {
  final wander = (0.25 + spice * 0.45).clamp(0.0, 0.75);
  final manhattan = (start.x - goal.x).abs() + (start.y - goal.y).abs();

  // Fast mode sur grandes tailles
  final int attempts = (n >= 6)
      ? (6 + (spice * 6).round())
      : (18 + (spice * 10).round());

  List<Point<int>>? best;
  double bestScore = -1;

  for (int walk = 0; walk < attempts; walk++) {
    final walkRng = Random(rng.nextInt(1 << 30));
    final path = _singleDrunkWalk(
      walkRng,
      n,
      start,
      goal,
      globalUsed,
      wander: wander,
      maxStepsOverride: (n >= 6) ? (n * n * 2) : null,
    );
    if (path == null) continue;

    final twists = _countTwists(path);
    final score = (path.length / manhattan.clamp(1, 9999)) + twists * 0.25;

    if (score > bestScore) {
      bestScore = score;
      best = path;
    }
  }

  best ??= _bfsPath(n, start, goal, globalUsed);
  return best;
}

List<Point<int>>? _singleDrunkWalk(
  Random rng,
  int n,
  Point<int> start,
  Point<int> goal,
  Set<Point<int>> globalUsed, {
  required double wander,
  int? maxStepsOverride,
}) {
  final maxSteps = maxStepsOverride ?? (n * n * 4);
  final maxBacktracks = (n >= 6) ? (n * n) : (n * n * 2);

  // visited = globalUsed + start, mais PAS goal
  final visited = <Point<int>>{...globalUsed, start}..remove(goal);

  final path = <Point<int>>[start];
  int backtracks = 0;

  const dirs = [Point(1, 0), Point(-1, 0), Point(0, 1), Point(0, -1)];

  while (path.isNotEmpty && path.length < maxSteps) {
    final cur = path.last;
    if (cur == goal) return path;

    final free = dirs
        .map((d) => Point<int>(cur.x + d.x, cur.y + d.y))
        .where((p) => _inside(n, p) && !visited.contains(p))
        .toList();

    if (free.isEmpty) {
      if (path.length <= 1 || backtracks >= maxBacktracks) return null;
      visited.remove(path.removeLast());
      backtracks++;
      continue;
    }

    Point<int> next;

    if (rng.nextDouble() < wander) {
      next = free[rng.nextInt(free.length)];
    } else {
      free.sort((a, b) {
        final da = (a.x - goal.x).abs() + (a.y - goal.y).abs();
        final db = (b.x - goal.x).abs() + (b.y - goal.y).abs();
        return da.compareTo(db);
      });
      final topK = free.take(2).toList();
      next = topK[rng.nextInt(topK.length)];
    }

    path.add(next);
    visited.add(next);
  }

  return null;
}

int _countTwists(List<Point<int>> path) {
  if (path.length < 3) return 0;
  int t = 0;
  for (int i = 1; i < path.length - 1; i++) {
    final dx1 = path[i].x - path[i - 1].x;
    final dy1 = path[i].y - path[i - 1].y;
    final dx2 = path[i + 1].x - path[i].x;
    final dy2 = path[i + 1].y - path[i].y;
    if (dx1 != dx2 || dy1 != dy2) t++;
  }
  return t;
}

/// ============================================================================
/// Fingerprint — pairs + blocked, puis MIN sur 8 symétries
/// ============================================================================
String _fingerprint(LevelDef l) {
  final n = l.size;

  (int, int) tr((int, int) p, int sym) {
    final (x, y) = p;
    return switch (sym) {
      0 => (x, y),
      1 => (n - 1 - x, y),
      2 => (x, n - 1 - y),
      3 => (n - 1 - x, n - 1 - y),
      4 => (y, x),
      5 => (n - 1 - y, x),
      6 => (y, n - 1 - x),
      _ => (n - 1 - y, n - 1 - x),
    };
  }

  String encBlocked(List<(int, int)> pts) {
    final s = pts.toList()
      ..sort(
        (a, b) => a.$1 != b.$1 ? a.$1.compareTo(b.$1) : a.$2.compareTo(b.$2),
      );
    return s.map((p) => '${p.$1},${p.$2}').join('|');
  }

  String encPairs(List<((int, int), (int, int))> prs) {
    final norm = prs.map((ab) {
      final a = ab.$1;
      final b = ab.$2;
      final aFirst = (a.$1 < b.$1) || (a.$1 == b.$1 && a.$2 <= b.$2);
      final first = aFirst ? a : b;
      final second = aFirst ? b : a;
      return '${first.$1},${first.$2}-${second.$1},${second.$2}';
    }).toList()..sort();
    return norm.join('|');
  }

  final basePairs = l.pairs
      .map((p) => ((p.a.x, p.a.y), (p.b.x, p.b.y)))
      .toList();
  final baseBlocked = l.blocked.map((p) => (p.x, p.y)).toList();

  String? best;
  for (int sym = 0; sym < 8; sym++) {
    final trPairs = basePairs
        .map((ab) => (tr(ab.$1, sym), tr(ab.$2, sym)))
        .toList();
    final trBlocked = baseBlocked.map((p) => tr(p, sym)).toList();

    final e =
        '${l.size}:${l.pairs.length}:${encPairs(trPairs)}:B:${encBlocked(trBlocked)}';
    if (best == null || e.compareTo(best) < 0) best = e;
  }
  return best!;
}

/// ============================================================================
/// Helpers
/// ============================================================================
int _randInt(Random rng, int min, int max) => min + rng.nextInt(max - min + 1);

int _minEndpointDist(int n) {
  // Règle dure “pas adjacents” gérée ailleurs (>=2)
  // Ici : juste éviter les endpoints collés quand possible
  return switch (n) {
    3 => 2,
    4 => 2,
    5 => 3,
    6 => 3,
    7 => 4,
    _ => 5,
  };
}

bool _inside(int n, Point<int> p) => p.x >= 0 && p.y >= 0 && p.x < n && p.y < n;

bool _isNeighbor(Point<int> a, Point<int> b) =>
    ((a.x - b.x).abs() + (a.y - b.y).abs()) == 1;

bool _pathIsValid(List<Point<int>> path) {
  if (path.length < 2) return false;

  final seen = <Point<int>>{};
  for (final p in path) {
    if (!seen.add(p)) return false;
  }

  for (int i = 0; i < path.length - 1; i++) {
    if (!_isNeighbor(path[i], path[i + 1])) return false;
  }

  return true;
}

/// ============================================================================
/// Endpoints
/// ============================================================================
(Point<int>, Point<int>)? _pickEndpoints(
  Random rng,
  int n,
  Set<Point<int>> used, {
  required int minDist,
}) {
  final free = <Point<int>>[];
  for (int y = 0; y < n; y++) {
    for (int x = 0; x < n; x++) {
      final p = Point<int>(x, y);
      if (!used.contains(p)) free.add(p);
    }
  }
  if (free.length < 2) return null;

  free.shuffle(rng);

  // Essai avec minDist
  for (int i = 0; i < min(140, free.length); i++) {
    for (int j = i + 1; j < min(280, free.length); j++) {
      final man = (free[i].x - free[j].x).abs() + (free[i].y - free[j].y).abs();
      if (man >= minDist) return (free[i], free[j]);
    }
  }

  // Fallback : plancher à 2
  for (int i = 0; i < free.length; i++) {
    for (int j = i + 1; j < free.length; j++) {
      final man = (free[i].x - free[j].x).abs() + (free[i].y - free[j].y).abs();
      if (man >= 2) return (free[i], free[j]);
    }
  }

  return null;
}

/// ============================================================================
/// BFS — fallback fiable (chemin le plus court)
/// ============================================================================
List<Point<int>>? _bfsPath(
  int n,
  Point<int> start,
  Point<int> goal,
  Set<Point<int>> blocked,
) {
  final eff = blocked.difference({start, goal});
  final prev = <Point<int>, Point<int>?>{start: null};
  final q = Queue<Point<int>>()..add(start);

  const dirs = [Point(1, 0), Point(-1, 0), Point(0, 1), Point(0, -1)];

  while (q.isNotEmpty) {
    final cur = q.removeFirst();
    if (cur == goal) break;

    for (final d in dirs) {
      final nxt = Point<int>(cur.x + d.x, cur.y + d.y);
      if (!_inside(n, nxt) || eff.contains(nxt) || prev.containsKey(nxt))
        continue;
      prev[nxt] = cur;
      q.add(nxt);
    }
  }

  if (!prev.containsKey(goal)) return null;

  final path = <Point<int>>[];
  Point<int>? cur = goal;
  while (cur != null) {
    path.add(cur);
    cur = prev[cur];
  }
  return path.reversed.toList();
}

/// ============================================================================
/// Obstacles
/// ============================================================================
Set<Point<int>> _genBlocked(Random rng, int n, double spice) {
  if (n <= 3) return {};

  // Sur 6x6+ : obstacles = taux d'échec énorme avec chemins disjoints => on coupe.
  if (n >= 6) return {};

  final maxB = switch (n) {
    4 => 1,
    5 => 3,
    _ => 0,
  };

  final wantCount = rng.nextDouble() < (0.35 + 0.50 * spice)
      ? (1 + rng.nextDouble() * spice * maxB).ceil().clamp(1, maxB)
      : 0;

  final blocked = <Point<int>>{};
  int guard = 0;

  while (blocked.length < wantCount && guard < 3000) {
    guard++;
    final p = Point<int>(rng.nextInt(n), rng.nextInt(n));

    final isCorner = (p.x == 0 || p.x == n - 1) && (p.y == 0 || p.y == n - 1);
    if (isCorner) continue;

    if (blocked.any((b) => _isNeighbor(b, p))) continue;
    if (!_gridIsConnected(n, {...blocked, p})) continue;

    blocked.add(p);
  }

  return blocked;
}

bool _gridIsConnected(int n, Set<Point<int>> blocked) {
  Point<int>? start;
  outer:
  for (int y = 0; y < n; y++) {
    for (int x = 0; x < n; x++) {
      final p = Point<int>(x, y);
      if (!blocked.contains(p)) {
        start = p;
        break outer;
      }
    }
  }
  if (start == null) return true;

  final visited = <Point<int>>{start};
  final q = Queue<Point<int>>()..add(start);
  const dirs = [Point(1, 0), Point(-1, 0), Point(0, 1), Point(0, -1)];

  while (q.isNotEmpty) {
    final cur = q.removeFirst();
    for (final d in dirs) {
      final nxt = Point<int>(cur.x + d.x, cur.y + d.y);
      if (!_inside(n, nxt) || blocked.contains(nxt) || visited.contains(nxt))
        continue;
      visited.add(nxt);
      q.add(nxt);
    }
  }

  int freeCount = 0;
  for (int y = 0; y < n; y++) {
    for (int x = 0; x < n; x++) {
      if (!blocked.contains(Point<int>(x, y))) freeCount++;
    }
  }
  return visited.length == freeCount;
}

/// ============================================================================
/// Export
/// ============================================================================
void _writeLevelsDart(List<LevelDef> levels) {
  final b = StringBuffer();
  b.writeln("import 'dart:math';");
  b.writeln("import 'package:flow_points/game/models/level.dart';");
  b.writeln("import 'package:flow_points/game/models/pair.dart';");
  b.writeln();
  b.writeln("class LevelsData {");
  b.writeln("  static final levels = <Level>[");

  for (final l in levels) {
    b.writeln("    Level(");
    b.writeln("      size: ${l.size},");
    b.writeln("      requireFullFill: ${l.requireFullFill},");
    b.writeln("      blocked: <Point<int>>{");
    for (final p in l.blocked) {
      b.writeln("        Point(${p.x}, ${p.y}),");
    }
    b.writeln("      },");
    b.writeln("      pairs: [");
    for (final p in l.pairs) {
      b.writeln(
        "        Pair(colorId: ${p.colorId}, a: Point(${p.a.x}, ${p.a.y}), b: Point(${p.b.x}, ${p.b.y})),",
      );
    }
    b.writeln("      ],");
    b.writeln("      solution: {");
    for (final e in l.solution.entries) {
      b.write("        ${e.key}: [");
      for (final pt in e.value) {
        b.write("Point(${pt.x}, ${pt.y}), ");
      }
      b.writeln("],");
    }
    b.writeln("      },");
    b.writeln("    ),");
  }

  b.writeln("  ];");
  b.writeln("}");
  File("lib/game/data/levels.dart").writeAsStringSync(b.toString());
}
