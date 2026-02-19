// tool/gen_levels.dart
import 'dart:io';
import 'dart:math';

/// Lance:
///   dart run tool/gen_levels.dart
/// ou (Windows Flutter)
///   /c/flutter/flutter_windows_3.xx.x-stable/flutter/bin/dart run tool/gen_levels.dart
///
/// Génère 300 niveaux FULL-FILL solvables (progressifs) et écrit:
///   lib/game/data/levels.dart
///
/// Principe:
/// - FULL-FILL toujours = toutes les cases libres doivent être remplies
/// - On génère un chemin Hamiltonien (qui visite toutes les cases libres) sur une grille avec obstacles
/// - On découpe ce chemin en K segments contigus (>= 2 cases chacun)
/// - Chaque segment devient une couleur: endpoints = début/fin du segment, solution = segment complet
///
/// Résultat:
/// - Toujours solvable (solution stockée dans level.solution)
/// - Difficile croissante: taille 3x3 -> 8x8, obstacles + couleurs augmentent progressivement

// ============================================================================
// MODELES (tool only)
// ============================================================================

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
  final Map<int, List<Point<int>>> solution; // endpoints inclus

  const LevelDef(
    this.size,
    this.pairs,
    this.solution, {
    required this.blocked,
    required this.requireFullFill,
  });
}

class DifficultyMetrics {
  final int turns; // nb de virages sur le ham global
  final int maxStraightRun; // plus longue ligne droite sur le ham global
  final int bottlenecks; // nb de cases libres avec <=2 voisins libres
  final bool hasTrickEndpoints; // endpoints piégeux

  const DifficultyMetrics({
    required this.turns,
    required this.maxStraightRun,
    required this.bottlenecks,
    required this.hasTrickEndpoints,
  });

  double score(int n, int freeCells) {
    // score simple : plus c'est haut, plus c'est dur
    return turns * 1.2 +
        maxStraightRun * -3.0 +
        bottlenecks * 2.0 +
        (hasTrickEndpoints ? 8.0 : 0.0) +
        freeCells * 0.05;
  }
}

// ============================================================================
// CONFIG (300 niveaux)
// ============================================================================

class Stage {
  final int size;
  final int colorsMin;
  final int colorsMax;
  final int blockedMin;
  final int blockedMax;
  final int count;

  const Stage({
    required this.size,
    required this.colorsMin,
    required this.colorsMax,
    required this.blockedMin,
    required this.blockedMax,
    required this.count,
  });
}

/// Seed fixe => reproductible
const int kSeed = 42;

/// FULL-FILL toujours
const bool kRequireFullFillAlways = true;

/// Tentatives max par niveau
const int kAttemptsPerLevel = 2500;

/// 300 niveaux, progression:
final stages = <Stage>[
  // 10 faciles (3x3)
  Stage(
    size: 3,
    colorsMin: 2,
    colorsMax: 2,
    blockedMin: 0,
    blockedMax: 0,
    count: 10,
  ),

  // 40 (4x4) -> facile à moyen
  Stage(
    size: 4,
    colorsMin: 2,
    colorsMax: 3,
    blockedMin: 0,
    blockedMax: 1,
    count: 20,
  ),
  Stage(
    size: 4,
    colorsMin: 3,
    colorsMax: 4,
    blockedMin: 0,
    blockedMax: 2,
    count: 20,
  ),

  // 60 (5x5) -> moyen
  Stage(
    size: 5,
    colorsMin: 3,
    colorsMax: 5,
    blockedMin: 0,
    blockedMax: 4,
    count: 30,
  ),
  Stage(
    size: 5,
    colorsMin: 4,
    colorsMax: 6,
    blockedMin: 1,
    blockedMax: 6,
    count: 30,
  ),

  // 70 (6x6) -> moyen + / dur
  Stage(
    size: 6,
    colorsMin: 5,
    colorsMax: 7,
    blockedMin: 2,
    blockedMax: 10,
    count: 35,
  ),
  Stage(
    size: 6,
    colorsMin: 6,
    colorsMax: 8,
    blockedMin: 4,
    blockedMax: 12,
    count: 35,
  ),

  // 60 (7x7) -> dur
  Stage(
    size: 7,
    colorsMin: 7,
    colorsMax: 9,
    blockedMin: 6,
    blockedMax: 18,
    count: 30,
  ),
  Stage(
    size: 7,
    colorsMin: 8,
    colorsMax: 10,
    blockedMin: 8,
    blockedMax: 20,
    count: 30,
  ),

  // 60 (8x8) -> très dur
  Stage(
    size: 8,
    colorsMin: 8,
    colorsMax: 10,
    blockedMin: 10,
    blockedMax: 26,
    count: 30,
  ),
  Stage(
    size: 8,
    colorsMin: 9,
    colorsMax: 10,
    blockedMin: 14,
    blockedMax: 30,
    count: 30,
  ),
];

// ============================================================================
// MAIN
// ============================================================================

void main() {
  final rng = Random(kSeed);
  final all = <LevelDef>[];

  final totalTarget = stages.fold<int>(0, (s, st) => s + st.count);
  stdout.writeln("=== FLOW FULL-FILL GEN: target=$totalTarget seed=$kSeed ===");

  for (final st in stages) {
    stdout.writeln(
      "\n=== STAGE size=${st.size} colors=[${st.colorsMin}-${st.colorsMax}] "
      "blocked=[${st.blockedMin}-${st.blockedMax}] count=${st.count} ===",
    );

    for (int i = 0; i < st.count; i++) {
      final lvl = _generateOne(rng, st);
      all.add(lvl);

      if (all.length % 10 == 0) {
        stdout.writeln("  -> ok (${all.length}/$totalTarget)");
      }
    }
  }

  _writeLevelsDart(all);
  stdout.writeln(
    "\n✅ Généré: ${all.length} niveaux -> lib/game/data/levels.dart",
  );
}

// ============================================================================
// GENERATION: 1 niveau FULL-FILL
// ============================================================================

LevelDef _generateOne(Random rng, Stage st) {
  final n = st.size;

  for (int attempt = 1; attempt <= kAttemptsPerLevel; attempt++) {
    final desiredK =
        st.colorsMin + rng.nextInt(st.colorsMax - st.colorsMin + 1);

    final blockedCount = (st.blockedMax <= st.blockedMin)
        ? st.blockedMin
        : (st.blockedMin + rng.nextInt(st.blockedMax - st.blockedMin + 1));

    final blocked = _pickBlocked(rng, n, blockedCount);
    final freeCells = n * n - blocked.length;

    // K max selon contrainte "segment >= 2"
    final kMax = freeCells ~/ 2;
    if (kMax < 2) continue;

    final k = min(desiredK, kMax);
    if (k < 2) continue;

    // anti-trap: aucun free cell ne doit être isolé au départ
    if (_hasIsolatedFreeCell(n, blocked)) continue;

    final ham = _findHamiltonianPath(rng, n, blocked);
    if (ham == null) continue;

    // split en K segments >=2
    final split = _splitIntoSegments(rng, ham, k);
    if (split == null) continue;

    final metrics = _analyzeDifficulty(n, blocked, ham, split);

    // filtres "humains" (progression)
    final maxStraightLimit = _maxStraightAllowed(n) + (blocked.length ~/ 6);
    if (metrics.maxStraightRun > maxStraightLimit) continue;
    if (metrics.turns < _minTurnsAllowed(n, ham.length)) continue;
    if (metrics.bottlenecks < _minBottlenecksAllowed(n)) continue;

    final mustHaveTrick = n >= 6; // à partir de 6x6 seulement
    if (mustHaveTrick && !metrics.hasTrickEndpoints) continue;

    final pairs = <PairDef>[];
    final solution = <int, List<Point<int>>>{};

    for (int colorId = 0; colorId < split.length; colorId++) {
      final seg = split[colorId];
      if (seg.length < 2) continue;

      pairs.add(PairDef(colorId, seg.first, seg.last));
      solution[colorId] = seg;
    }

    // re-check couverture totale (full fill)
    if (!_coversAllFreeCells(n, blocked, solution)) continue;

    return LevelDef(
      n,
      pairs,
      solution,
      blocked: blocked,
      requireFullFill: kRequireFullFillAlways,
    );
  }

  stdout.writeln(
    "⚠️ fallback size=$n (pas trouvé) -> simple snake sans obstacles",
  );
  return _fallbackSnake(n, 2);
}

// ============================================================================
// OBSTACLES
// ============================================================================

Set<Point<int>> _pickBlocked(Random rng, int n, int count) {
  // limites raisonnables sur petites grilles
  if (n == 3) count = 0;
  if (n == 4) count = min(count, 2);
  if (n == 5) count = min(count, 6);

  // garde un minimum de cases libres
  final maxBlocked = (n * n) - 8; // 8 libres minimum
  count = count.clamp(0, maxBlocked);

  final all = <Point<int>>[];
  for (int y = 0; y < n; y++) {
    for (int x = 0; x < n; x++) {
      all.add(Point(x, y));
    }
  }
  all.shuffle(rng);

  final blocked = <Point<int>>{};
  for (final p in all) {
    if (blocked.length >= count) break;

    final isBorder = p.x == 0 || p.y == 0 || p.x == n - 1 || p.y == n - 1;
    if (n <= 4 && isBorder && rng.nextDouble() < 0.8) continue; // 80% on évite

    blocked.add(p);
  }

  return blocked;
}

bool _hasIsolatedFreeCell(int n, Set<Point<int>> blocked) {
  for (int y = 0; y < n; y++) {
    for (int x = 0; x < n; x++) {
      final p = Point(x, y);
      if (blocked.contains(p)) continue;

      int deg = 0;
      for (final nb in _neighbors(n, p)) {
        if (!blocked.contains(nb)) deg++;
      }
      if (deg == 0) return true;
    }
  }
  return false;
}

// ============================================================================
// HAMILTONIAN PATH (Warnsdorff + backtracking)
// ============================================================================

List<Point<int>>? _findHamiltonianPath(
  Random rng,
  int n,
  Set<Point<int>> blocked,
) {
  final totalFree = n * n - blocked.length;

  final starts = <Point<int>>[];
  for (int y = 0; y < n; y++) {
    for (int x = 0; x < n; x++) {
      final p = Point(x, y);
      if (!blocked.contains(p)) starts.add(p);
    }
  }
  starts.shuffle(rng);

  for (final start in starts.take(min(12, starts.length))) {
    final visited = <Point<int>>{};
    final path = <Point<int>>[];

    bool dfs(Point<int> cur) {
      visited.add(cur);
      path.add(cur);

      if (path.length == totalFree) return true;

      if (n >= 7) {
        if (!_remainingIsConnected(n, blocked, visited)) {
          visited.remove(cur);
          path.removeLast();
          return false;
        }
      }

      final nexts = _neighbors(
        n,
        cur,
      ).where((p) => !blocked.contains(p) && !visited.contains(p)).toList();

      nexts.sort((a, b) {
        final da = _freeDegree(n, a, blocked, visited);
        final db = _freeDegree(n, b, blocked, visited);
        if (da != db) return da.compareTo(db);
        return rng.nextInt(3) - 1; // petit tie-break random
      });

      for (final nb in nexts) {
        if (n >= 7) {
          if (_tooManyForcedDeadEnds(n, blocked, visited, nb)) continue;
        }
        if (dfs(nb)) return true;
      }

      visited.remove(cur);
      path.removeLast();
      return false;
    }

    if (dfs(start)) return path;
  }

  return null;
}

int _freeDegree(
  int n,
  Point<int> p,
  Set<Point<int>> blocked,
  Set<Point<int>> visited,
) {
  int d = 0;
  for (final nb in _neighbors(n, p)) {
    if (blocked.contains(nb)) continue;
    if (visited.contains(nb)) continue;
    d++;
  }
  return d;
}

bool _remainingIsConnected(
  int n,
  Set<Point<int>> blocked,
  Set<Point<int>> visited,
) {
  Point<int>? start;
  for (int y = 0; y < n && start == null; y++) {
    for (int x = 0; x < n; x++) {
      final p = Point(x, y);
      if (blocked.contains(p)) continue;
      if (visited.contains(p)) continue;
      start = p;
      break;
    }
  }
  if (start == null) return true;

  final seen = <Point<int>>{};
  final stack = <Point<int>>[start];

  while (stack.isNotEmpty) {
    final p = stack.removeLast();
    if (!seen.add(p)) continue;

    for (final nb in _neighbors(n, p)) {
      if (blocked.contains(nb)) continue;
      if (visited.contains(nb)) continue;
      if (!seen.contains(nb)) stack.add(nb);
    }
  }

  for (int y = 0; y < n; y++) {
    for (int x = 0; x < n; x++) {
      final p = Point(x, y);
      if (blocked.contains(p)) continue;
      if (visited.contains(p)) continue;
      if (!seen.contains(p)) return false;
    }
  }
  return true;
}

bool _tooManyForcedDeadEnds(
  int n,
  Set<Point<int>> blocked,
  Set<Point<int>> visited,
  Point<int> candidate,
) {
  final tmpVisited = {...visited, candidate};

  int forced = 0;
  for (int y = 0; y < n; y++) {
    for (int x = 0; x < n; x++) {
      final p = Point(x, y);
      if (blocked.contains(p)) continue;
      if (tmpVisited.contains(p)) continue;

      final d = _freeDegree(n, p, blocked, tmpVisited);
      if (d <= 1) forced++;
      if (forced >= 3) return true;
    }
  }
  return false;
}

// ============================================================================
// SPLIT PATH -> segments (K couleurs, chaque segment >=2)
// ============================================================================

List<List<Point<int>>>? _splitIntoSegments(
  Random rng,
  List<Point<int>> path,
  int k,
) {
  final total = path.length;
  if (k * 2 > total) return null;

  final sizes = List<int>.filled(k, 2);
  int remaining = total - (k * 2);

  while (remaining > 0) {
    final i = rng.nextInt(k);
    sizes[i]++;
    remaining--;
  }

  final out = <List<Point<int>>>[];
  int cursor = 0;

  for (int i = 0; i < k; i++) {
    final len = sizes[i];
    final seg = path.sublist(cursor, cursor + len);
    cursor += len;
    out.add(seg);
  }

  if (cursor != total) return null;
  return out;
}

bool _coversAllFreeCells(
  int n,
  Set<Point<int>> blocked,
  Map<int, List<Point<int>>> solution,
) {
  final used = <Point<int>>{};
  for (final seg in solution.values) {
    used.addAll(seg);
  }

  for (int y = 0; y < n; y++) {
    for (int x = 0; x < n; x++) {
      final p = Point(x, y);
      if (blocked.contains(p)) continue;
      if (!used.contains(p)) return false;
    }
  }
  return true;
}

// ============================================================================
// HELPERS
// ============================================================================

Iterable<Point<int>> _neighbors(int n, Point<int> p) sync* {
  final cands = [
    Point(p.x + 1, p.y),
    Point(p.x - 1, p.y),
    Point(p.x, p.y + 1),
    Point(p.x, p.y - 1),
  ];
  for (final q in cands) {
    if (q.x >= 0 && q.y >= 0 && q.x < n && q.y < n) yield q;
  }
}

DifficultyMetrics _analyzeDifficulty(
  int n,
  Set<Point<int>> blocked,
  List<Point<int>> ham,
  List<List<Point<int>>> split,
) {
  // turns + maxStraightRun sur le chemin global
  int turns = 0;
  int maxStraight = 1;
  int curStraight = 1;

  int dxPrev = 0, dyPrev = 0;

  for (int i = 1; i < ham.length; i++) {
    final a = ham[i - 1];
    final b = ham[i];
    final dx = b.x - a.x;
    final dy = b.y - a.y;

    if (i == 1) {
      dxPrev = dx;
      dyPrev = dy;
      curStraight = 2;
      maxStraight = 2;
      continue;
    }

    if (dx == dxPrev && dy == dyPrev) {
      curStraight++;
      if (curStraight > maxStraight) maxStraight = curStraight;
    } else {
      turns++;
      dxPrev = dx;
      dyPrev = dy;
      curStraight = 2;
    }
  }

  // bottlenecks = cases libres avec peu de voisins libres
  int bottlenecks = 0;
  for (int y = 0; y < n; y++) {
    for (int x = 0; x < n; x++) {
      final c = Point<int>(x, y);
      if (blocked.contains(c)) continue;

      int freeNeigh = 0;
      for (final nb in _neighbors(n, c)) {
        if (!blocked.contains(nb)) freeNeigh++;
      }
      if (freeNeigh <= 2) bottlenecks++;
    }
  }

  // endpoints "piégeux" (idée hackaton)
  bool tricky(Point<int> e, int segLen) {
    int freeNeigh = 0;
    for (final nb in _neighbors(n, e)) {
      if (!blocked.contains(nb)) freeNeigh++;
    }

    final isBorder = e.x == 0 || e.y == 0 || e.x == n - 1 || e.y == n - 1;

    // "piège humain": endpoint dans un couloir / proche goulot + segment pas trop long
    return (freeNeigh <= 2) && !isBorder && segLen <= max(4, n);
  }

  bool hasTrick = false;
  for (final seg in split) {
    final a = seg.first;
    final b = seg.last;
    final len = seg.length;

    if (tricky(a, len) || tricky(b, len)) {
      hasTrick = true;
      break;
    }
  }

  return DifficultyMetrics(
    turns: turns,
    maxStraightRun: maxStraight,
    bottlenecks: bottlenecks,
    hasTrickEndpoints: hasTrick,
  );
}

// seuils “humains” (tu peux ajuster)
int _maxStraightAllowed(int n) => (n <= 4)
    ? 6
    : (n <= 6)
    ? 7
    : 8;

int _minTurnsAllowed(int n, int hamLen) {
  // plus la grille est grande, plus on veut de virages
  if (n <= 3) return 2;
  if (n == 4) return 5;
  if (n == 5) return 10;
  if (n == 6) return 16;
  if (n == 7) return 22;
  return 30; // 8x8
}

int _minBottlenecksAllowed(int n) {
  if (n <= 3) return 1;
  if (n == 4) return 2;
  if (n == 5) return 4;
  if (n == 6) return 6;
  if (n == 7) return 8;
  return 10;
}

// ============================================================================
// FALLBACK (si vraiment impossible): snake sans obstacles
// ============================================================================

LevelDef _fallbackSnake(int n, int k) {
  final snake = <Point<int>>[];
  for (int y = 0; y < n; y++) {
    if (y.isEven) {
      for (int x = 0; x < n; x++) {
        snake.add(Point(x, y));
      }
    } else {
      for (int x = n - 1; x >= 0; x--) {
        snake.add(Point(x, y));
      }
    }
  }

  final freeCells = snake.length;
  final kMax = freeCells ~/ 2;
  k = k.clamp(2, kMax);

  final split = _splitIntoSegments(Random(1), snake, k)!;

  final pairs = <PairDef>[];
  final solution = <int, List<Point<int>>>{};

  for (int cid = 0; cid < split.length; cid++) {
    final seg = split[cid];
    pairs.add(PairDef(cid, seg.first, seg.last));
    solution[cid] = seg;
  }

  return LevelDef(n, pairs, solution, blocked: const {}, requireFullFill: true);
}

// ============================================================================
// ÉCRITURE lib/game/data/levels.dart
// IMPORTANT: "static final" (pas const) pour éviter l'erreur d'égalité primitive
// ============================================================================

void _writeLevelsDart(List<LevelDef> levels) {
  final b = StringBuffer();
  b.writeln("import 'dart:math';");
  b.writeln("import 'package:flow_points/game/models/level.dart';");
  b.writeln("import 'package:flow_points/game/models/pair.dart';");
  b.writeln("");
  b.writeln("class LevelsData {");
  b.writeln("  static final List<Level> levels = [");

  for (final l in levels) {
    b.writeln("    Level(");
    b.writeln("      size: ${l.size},");
    b.writeln("      requireFullFill: ${l.requireFullFill},");

    // blocked (Set<Point<int>>)
    if (l.blocked.isEmpty) {
      b.writeln("      blocked: <Point<int>>{},");
    } else {
      b.writeln("      blocked: {");
      for (final c in l.blocked) {
        b.writeln("        Point(${c.x}, ${c.y}),");
      }
      b.writeln("      },");
    }

    // pairs
    b.writeln("      pairs: [");
    for (final p in l.pairs) {
      b.writeln(
        "        Pair(colorId: ${p.colorId}, a: Point(${p.a.x}, ${p.a.y}), b: Point(${p.b.x}, ${p.b.y})),",
      );
    }
    b.writeln("      ],");

    // solution
    b.writeln("      solution: {");
    for (final entry in l.solution.entries) {
      final cid = entry.key;
      final path = entry.value;
      b.write("        $cid: [");
      for (final pt in path) {
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
