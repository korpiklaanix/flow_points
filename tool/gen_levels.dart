// tool/gen_levels.dart
import 'dart:io';
import 'dart:math';

/// ============================================================================
/// Générateur FLOW / Numberlink FULL-FILL (TOUJOURS solvable + rapide + varié)
/// ============================================================================
/// Je lance :
///   dart run tool/gen_levels.dart
///
/// Principe :
/// - Je construis une "solution" complète en partant d'un chemin Hamiltonien
///   (visite toutes les cases exactement une fois).
/// - Je RANDOMISE ce chemin très fortement via BACKBITE (rapide, sans DFS).
/// - Je découpe le chemin en segments contigus => chaque segment = une couleur.
/// - Endpoints = début/fin du segment ; solution[color] = segment complet.
/// - FULL-FILL : toutes les cases sont couvertes.
///
/// Sécurités intégrées :
/// - Je valide que le chemin est correct (adjacent case à case)
/// - Je refuse endpoints adjacents (trop trivial)
/// - Je vérifie que la solution couvre toutes les cases exactement 1 fois
///
/// Résultat :
/// - Plus de freeze en 7x7/8x8
/// - Plus de niveaux "biscornus" (backbite casse l'alignement)
/// - Plus de niveaux insolvables (sauts impossibles)
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
  const Stage({
    required this.size,
    required this.colorsMin,
    required this.colorsMax,
    required this.count,
  });
}

const int kSeed = 42;

/// 👉 Tu peux enlever le 2e stage 3x3 si tu veux, ça ne casse rien.
/// Le target est recalculé automatiquement.
final stages = <Stage>[
  Stage(size: 3, colorsMin: 2, colorsMax: 2, count: 5),
  // Stage(size: 3, colorsMin: 3, colorsMax: 3, count: 5),
  Stage(size: 4, colorsMin: 3, colorsMax: 4, count: 20),
  Stage(size: 4, colorsMin: 4, colorsMax: 5, count: 20),
  Stage(size: 5, colorsMin: 4, colorsMax: 6, count: 30),
  Stage(size: 5, colorsMin: 5, colorsMax: 7, count: 30),
  Stage(size: 6, colorsMin: 5, colorsMax: 7, count: 35),
  Stage(size: 6, colorsMin: 6, colorsMax: 8, count: 35),
  Stage(size: 7, colorsMin: 6, colorsMax: 8, count: 30),
  Stage(size: 7, colorsMin: 7, colorsMax: 9, count: 30),
  Stage(size: 8, colorsMin: 7, colorsMax: 9, count: 30),
  Stage(size: 8, colorsMin: 8, colorsMax: 10, count: 30),
];

void main() {
  final rng = Random(kSeed);
  final all = <LevelDef>[];
  final totalTarget = stages.fold<int>(0, (s, st) => s + st.count);

  stdout.writeln("=== FLOW GEN target=$totalTarget seed=$kSeed ===");

  for (final st in stages) {
    stdout.writeln("-> generating stage size=${st.size} count=${st.count}");

    int made = 0;
    int printed = 0;

    for (int i = 0; i < st.count; i++) {
      final level = _generateOneLevel(rng, st);
      if (level != null) {
        all.add(level);
        made++;
      } else {
        // Si ça arrive souvent, c'est que les contraintes sont trop strictes.
        // Ici c'est rare, mais on laisse le log possible pour debug.
        // stdout.writeln("  warn: failed to generate one level for size=${st.size}");
      }

      if (st.count >= 20 && made >= printed + 5) {
        printed = made;
        stdout.writeln("  ... size=${st.size} progress $made/${st.count}");
      }
    }

    stdout.writeln(
      "size=${st.size} colors=[${st.colorsMin}-${st.colorsMax}] -> +$made (total ${all.length}/$totalTarget)",
    );
  }

  _writeLevelsDart(all);
  stdout.writeln("\n✅ ${all.length} niveaux → lib/game/data/levels.dart");
}

/// ============================================================================
/// Génération d’un niveau
/// ============================================================================
LevelDef? _generateOneLevel(Random rng, Stage st) {
  final n = st.size;

  // Avec backbite + validations, ça sort vite.
  for (int attempt = 0; attempt < 3000; attempt++) {
    final ham = _randomHamiltonianPathBackbite(rng, n);

    // sécurité : ham doit être un vrai chemin sur la grille
    if (!_isValidPath(ham, n)) continue;

    final level = _trySegmentationOnHam(rng, ham, st);
    if (level != null) return level;
  }

  return null;
}

LevelDef? _trySegmentationOnHam(Random rng, List<Point<int>> ham, Stage st) {
  final n = st.size;

  final minLen = _minSegmentLen(n);
  final kMax = ham.length ~/ minLen;

  final desiredK = st.colorsMin + rng.nextInt(st.colorsMax - st.colorsMin + 1);
  final k = desiredK.clamp(2, kMax);

  // Je tente plusieurs découpes sur le même ham (rapide)
  for (int cutTry = 0; cutTry < 250; cutTry++) {
    final sizes = _makeSegmentSizes(
      rng,
      total: ham.length,
      k: k,
      minLen: minLen,
    );

    final segs = <List<Point<int>>>[];
    int cursor = 0;
    for (final len in sizes) {
      segs.add(ham.sublist(cursor, cursor + len));
      cursor += len;
    }

    // Endpoints non adjacents (anti-trivial)
    bool ok = true;
    for (final seg in segs) {
      final a = seg.first;
      final b = seg.last;
      final man = (a.x - b.x).abs() + (a.y - b.y).abs();
      if (man < 2) {
        ok = false;
        break;
      }
    }
    if (!ok) continue;

    // Build
    final pairs = <PairDef>[];
    final solution = <int, List<Point<int>>>{};

    for (int cid = 0; cid < segs.length; cid++) {
      pairs.add(PairDef(cid, segs[cid].first, segs[cid].last));
      solution[cid] = segs[cid];
    }

    // sécurité : couvre tout exactement 1 fois
    if (!_coversAllExactlyOnce(solution, n)) continue;

    return LevelDef(
      n,
      pairs,
      solution,
      blocked: const {},
      requireFullFill: true,
    );
  }

  return null;
}

/// ============================================================================
/// Segment sizes
/// ============================================================================
int _minSegmentLen(int n) {
  if (n <= 3) return 2;
  if (n == 4) return 3;
  if (n == 5) return 4;
  if (n == 6) return 5;
  if (n == 7) return 6;
  return 7; // 8x8
}

List<int> _makeSegmentSizes(
  Random rng, {
  required int total,
  required int k,
  required int minLen,
}) {
  final sizes = List<int>.filled(k, minLen);
  int rem = total - k * minLen;

  // Je distribue le reste avec un peu de biais pour créer des segments longs
  while (rem > 0) {
    final r = rng.nextDouble();
    final idx = (r < 0.60)
        ? rng.nextInt(k)
        : (r < 0.90)
        ? _pickBiasedIndex(rng, k)
        : rng.nextInt(k);
    sizes[idx]++;
    rem--;
  }

  sizes.shuffle(rng);
  return sizes;
}

int _pickBiasedIndex(Random rng, int k) {
  final t = rng.nextDouble();
  if (t < 0.50) return rng.nextInt((k / 3).ceil());
  if (t < 0.80) return k - 1 - rng.nextInt((k / 3).ceil());
  return rng.nextInt(k);
}

/// ============================================================================
/// Validations
/// ============================================================================
bool _isGridNeighbor(Point<int> a, Point<int> b) {
  final dx = (a.x - b.x).abs();
  final dy = (a.y - b.y).abs();
  return (dx + dy) == 1;
}

bool _isValidPath(List<Point<int>> path, int n) {
  if (path.length != n * n) return false;

  final seen = <Point<int>>{};
  for (final p in path) {
    if (p.x < 0 || p.y < 0 || p.x >= n || p.y >= n) return false;
    if (!seen.add(p)) return false;
  }

  for (int i = 0; i < path.length - 1; i++) {
    if (!_isGridNeighbor(path[i], path[i + 1])) return false;
  }
  return true;
}

bool _coversAllExactlyOnce(Map<int, List<Point<int>>> solution, int n) {
  final seen = <Point<int>>{};
  int count = 0;

  for (final seg in solution.values) {
    for (final p in seg) {
      count++;
      if (!seen.add(p)) return false;
    }
  }

  return count == n * n && seen.length == n * n;
}

/// ============================================================================
/// Hamiltonien : Snake + Backbite (version SAFE)
/// ============================================================================
List<Point<int>> _snakePath(int n) {
  final path = <Point<int>>[];
  for (int y = 0; y < n; y++) {
    if (y.isEven) {
      for (int x = 0; x < n; x++) path.add(Point<int>(x, y));
    } else {
      for (int x = n - 1; x >= 0; x--) path.add(Point<int>(x, y));
    }
  }
  return path;
}

/// Backbite correct :
/// - Part d'un chemin Hamiltonien valide.
/// - Applique des moves qui gardent un chemin valide.
/// - Si quelque chose se casse (ne devrait pas), on retombe sur le snake.
List<Point<int>> _randomHamiltonianPathBackbite(Random rng, int n) {
  var path = _snakePath(n);

  final indexOf = <Point<int>, int>{};
  void rebuildIndex() {
    indexOf.clear();
    for (int i = 0; i < path.length; i++) {
      indexOf[path[i]] = i;
    }
  }

  rebuildIndex();

  final steps = max(4000, n * n * 900);

  for (int step = 0; step < steps; step++) {
    final useHead = rng.nextBool();
    final L = path.length - 1;
    final end = useHead ? path[0] : path[L];

    final candidates = <Point<int>>[
      Point<int>(end.x + 1, end.y),
      Point<int>(end.x - 1, end.y),
      Point<int>(end.x, end.y + 1),
      Point<int>(end.x, end.y - 1),
    ].where((p) => p.x >= 0 && p.y >= 0 && p.x < n && p.y < n).toList();

    candidates.shuffle(rng);

    bool moved = false;

    for (final nb in candidates) {
      final j = indexOf[nb];
      if (j == null) continue;

      if (useHead) {
        // head=0 ; voisin sur le chemin = 1
        if (j == 0 || j == 1) continue;

        // new = reverse(path[0..j-1]) + path[j..L]
        // mais on construit en conservant des adjacences correctes
        final left = path.sublist(0, j).reversed.toList(); // j-1..0
        final right = path.sublist(j); // j..L
        path = [...left, ...right];

        rebuildIndex();
        moved = true;
        break;
      } else {
        // tail=L ; voisin sur le chemin = L-1
        if (j == L || j == L - 1) continue;

        // new = path[0..j] + reverse(path[j+1..L])
        final prefix = path.sublist(0, j + 1);
        final suffix = path.sublist(j + 1).reversed.toList(); // L..j+1
        path = [...prefix, ...suffix];

        rebuildIndex();
        moved = true;
        break;
      }
    }

    if (!moved) continue;
  }

  // Safety net : jamais de chemin cassé
  if (!_isValidPath(path, n)) return _snakePath(n);

  return rng.nextBool() ? path : path.reversed.toList();
}

/// ============================================================================
/// Export lib/game/data/levels.dart
/// ============================================================================
void _writeLevelsDart(List<LevelDef> levels) {
  final b = StringBuffer();
  b.writeln("import 'dart:math';");
  b.writeln("import 'package:flow_points/game/models/level.dart';");
  b.writeln("import 'package:flow_points/game/models/pair.dart';");
  b.writeln("");
  b.writeln("class LevelsData {");
  b.writeln("  static final levels = <Level>[");

  for (final l in levels) {
    b.writeln("    Level(");
    b.writeln("      size: ${l.size},");
    b.writeln("      requireFullFill: ${l.requireFullFill},");
    b.writeln("      blocked: <Point<int>>{},");

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
