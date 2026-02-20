import 'dart:io';
import 'dart:math';

/// dart run tool/gen_levels.dart
/// ou /c/flutter/flutter_windows_3.41.1-stable/flutter/bin/flutter run -t tool/gen_levels.dart
/// Génère des niveaux procéduralement et les écrit dans lib/game/data/levels.dart
///
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

final stages = <Stage>[
  Stage(size: 3, colorsMin: 2, colorsMax: 2, count: 5),
  Stage(size: 3, colorsMin: 3, colorsMax: 3, count: 5),
  Stage(size: 4, colorsMin: 3, colorsMax: 4, count: 20),
  Stage(size: 4, colorsMin: 4, colorsMax: 5, count: 20),
  Stage(size: 5, colorsMin: 3, colorsMax: 5, count: 30),
  Stage(size: 5, colorsMin: 4, colorsMax: 6, count: 30),
  Stage(size: 6, colorsMin: 4, colorsMax: 6, count: 35),
  Stage(size: 6, colorsMin: 5, colorsMax: 7, count: 35),
  Stage(size: 7, colorsMin: 5, colorsMax: 7, count: 30),
  Stage(size: 7, colorsMin: 6, colorsMax: 8, count: 30),
  Stage(size: 8, colorsMin: 6, colorsMax: 8, count: 30),
  Stage(size: 8, colorsMin: 7, colorsMax: 9, count: 30),
];

int _manhattan(Point<int> a, Point<int> b) =>
    (a.x - b.x).abs() + (a.y - b.y).abs();

void main() {
  final rng = Random(kSeed);
  final all = <LevelDef>[];
  final totalTarget = stages.fold<int>(0, (s, st) => s + st.count);
  stdout.writeln("=== FLOW GEN target=$totalTarget ===");

  for (final st in stages) {
    for (int i = 0; i < st.count; i++) {
      // Réessayer jusqu'à trouver un niveau avec endpoints non-adjacents
      for (int attempt = 0; attempt < 10000; attempt++) {
        final level = _tryGenerate(rng, st);
        if (level != null) {
          all.add(level);
          break;
        }
      }
    }
    stdout.writeln(
      "size=${st.size} [${st.colorsMin}-${st.colorsMax}]: ${all.length}/$totalTarget",
    );
  }

  _writeLevelsDart(all);
  stdout.writeln("\n✅ ${all.length} niveaux → lib/game/data/levels.dart");
}

LevelDef? _tryGenerate(Random rng, Stage st) {
  final n = st.size;
  final ham = _snakeVariant(rng, n);

  final minLen = n <= 4
      ? 2
      : n <= 5
      ? 3
      : n <= 6
      ? 4
      : n <= 7
      ? 5
      : 6;
  final kMax = ham.length ~/ minLen;
  final k = (st.colorsMin + rng.nextInt(st.colorsMax - st.colorsMin + 1)).clamp(
    2,
    kMax,
  );

  final sizes = List<int>.filled(k, minLen);
  int rem = ham.length - k * minLen;
  while (rem > 0) {
    sizes[rng.nextInt(k)]++;
    rem--;
  }
  sizes.shuffle(rng);

  final segs = <List<Point<int>>>[];
  int cursor = 0;
  for (final len in sizes) {
    segs.add(ham.sublist(cursor, cursor + len));
    cursor += len;
  }

  // Filtre: endpoints de chaque couleur à distance >= 2 (pas adjacents, min "U")
  for (final seg in segs) {
    if (_manhattan(seg.first, seg.last) < 2) return null;
  }

  final pairs = <PairDef>[];
  final solution = <int, List<Point<int>>>{};
  for (int cid = 0; cid < segs.length; cid++) {
    pairs.add(PairDef(cid, segs[cid].first, segs[cid].last));
    solution[cid] = segs[cid];
  }
  return LevelDef(n, pairs, solution, blocked: const {}, requireFullFill: true);
}

List<Point<int>> _snakeVariant(Random rng, int n) {
  final snake = <Point<int>>[];
  for (int y = 0; y < n; y++) {
    if (y.isEven) {
      for (int x = 0; x < n; x++) snake.add(Point<int>(x, y));
    } else {
      for (int x = n - 1; x >= 0; x--) snake.add(Point<int>(x, y));
    }
  }

  final flipX = rng.nextBool();
  final flipY = rng.nextBool();
  final swapXY = rng.nextBool();
  final rev = rng.nextBool();

  Point<int> tr(Point<int> p) {
    int x = p.x, y = p.y;
    if (flipX) x = n - 1 - x;
    if (flipY) y = n - 1 - y;
    if (swapXY) {
      final t = x;
      x = y;
      y = t;
    }
    return Point<int>(x, y);
  }

  final mapped = snake.map(tr).toList();
  return rev ? mapped.reversed.toList() : mapped;
}

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
      for (final pt in e.value) b.write("Point(${pt.x}, ${pt.y}), ");
      b.writeln("],");
    }
    b.writeln("      },");
    b.writeln("    ),");
  }
  b.writeln("  ];");
  b.writeln("}");
  File("lib/game/data/levels.dart").writeAsStringSync(b.toString());
}
