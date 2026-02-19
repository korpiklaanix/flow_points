import 'dart:math';
import 'pair.dart';

class Level {
  final int size;
  final List<Pair> pairs;

  /// cases bloquées (obstacles)
  final Set<Point<int>> blocked;

  /// si true : toutes les cases libres doivent être remplies
  final bool requireFullFill;

  /// solution optionnelle (pour générateur / debug)
  final Map<int, List<Point<int>>> solution;

  const Level({
    required this.size,
    required this.pairs,
    this.blocked = const {},
    this.requireFullFill = false,
    this.solution = const {},
  });
}
