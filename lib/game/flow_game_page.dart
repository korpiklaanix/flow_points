import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flow_points/game/models/level.dart';
import 'package:flow_points/game/models/pair.dart';
import 'package:flow_points/game/data/levels.dart';
import 'package:flow_points/game/progress/game_progress.dart';
import 'package:flow_points/game/levels/levels_library_page.dart';
import 'package:flow_points/theme/app_colors.dart';

bool isAdj(Point<int> p1, Point<int> p2) {
  final dx = (p1.x - p2.x).abs();
  final dy = (p1.y - p2.y).abs();
  return (dx + dy) == 1;
}

enum _PowerType { hint, solve }

class FlowGamePage extends StatefulWidget {
  final int startLevelIndex;

  const FlowGamePage({super.key, this.startLevelIndex = 0});

  @override
  State<FlowGamePage> createState() => _FlowGamePageState();
}

class _FlowGamePageState extends State<FlowGamePage> {
  final List<Level> levels = LevelsData.levels;

  static const int _hintPrice = 150;
  static const int _solvePrice = 400;
  static const int _baseReward = 120;

  int levelIndex = 0;
  int unlockedLevel = 0;

  int coins = 0;
  int hints = 0;
  int solves = 0;

  int? _hintColorId; // visuel highlight endpoints
  bool _usingPower = false;

  bool _usedSolveThisLevel = false; // => récompense 0
  bool _usedHintThisLevel = false; // => récompense /2

  final List<Color> palette = AppColors.palette;

  Level get level => levels[levelIndex];
  int get n => level.size;

  late List<List<int>> boardOcc; // [x][y] = colorId ou -1
  static const int _empty = -1;
  static const int _blocked = -2;
  final Map<int, List<Point<int>>> paths =
      {}; // colorId -> path (sans endpoints)

  int? drawingColorId;
  List<Point<int>> currentPath = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _initProgress();
  }

  Future<void> _initProgress() async {
    unlockedLevel = await GameProgress.getUnlockedLevel();
    await _refreshWallet();

    final start = widget.startLevelIndex.clamp(0, levels.length - 1);
    final safeStart = min(start, unlockedLevel);

    _loadLevel(safeStart);

    _loading = false;
    if (mounted) setState(() {});
  }

  Future<void> _refreshWallet() async {
    coins = await GameProgress.getCoins();
    hints = await GameProgress.getHintCount();
    solves = await GameProgress.getSolveCount();
    if (mounted) setState(() {});
  }

  void _loadLevel(int idx) {
    levelIndex = idx;

    _hintColorId = null;
    _usedSolveThisLevel = false;
    _usedHintThisLevel = false;

    boardOcc = List.generate(n, (_) => List.filled(n, _empty));
    paths.clear();

    for (final b in level.blocked) {
      if (_inBounds(b)) {
        _setOcc(b, _blocked);
      }
    }

    for (final p in level.pairs) {
      _setOcc(p.a, p.colorId);
      _setOcc(p.b, p.colorId);
      paths[p.colorId] = [];
    }

    drawingColorId = null;
    currentPath = [];
    setState(() {});
  }

  void _setOcc(Point<int> cell, int colorId) =>
      boardOcc[cell.x][cell.y] = colorId;
  int _getOcc(Point<int> cell) => boardOcc[cell.x][cell.y];

  bool _inBounds(Point<int> c) => c.x >= 0 && c.y >= 0 && c.x < n && c.y < n;

  Pair? _pairForColor(int colorId) {
    for (final p in level.pairs) {
      if (p.colorId == colorId) return p;
    }
    return null;
  }

  bool _isEndpoint(Point<int> c, int colorId) {
    final pair = _pairForColor(colorId);
    if (pair == null) return false;
    return (c == pair.a) || (c == pair.b);
  }

  void _clearPath(int colorId) {
    // Efface toutes les cases de cette couleur (sauf endpoints et obstacles).
    for (int x = 0; x < n; x++) {
      for (int y = 0; y < n; y++) {
        final cell = Point<int>(x, y);
        if (_getOcc(cell) == colorId && !_isEndpoint(cell, colorId)) {
          _setOcc(cell, _empty);
        }
      }
    }

    // on reset le path mémoire
    paths[colorId] = [];
  }

  /// Applique la solution d'une couleur (chemin complet A→B depuis level.solution).
  void _applyColorSolution(int colorId) {
    final sol = level.solution[colorId];
    if (sol == null || sol.length < 2) return;

    _clearPath(colorId);

    final pair = _pairForColor(colorId);
    if (pair == null) return;

    _setOcc(pair.a, colorId);
    _setOcc(pair.b, colorId);

    for (final cell in sol) {
      if (_getOcc(cell) == _blocked) continue;
      if (!_isEndpoint(cell, colorId)) _setOcc(cell, colorId);
    }

    paths[colorId] = sol
        .where((c) => !_isEndpoint(c, colorId) && _getOcc(c) != _blocked)
        .toList();
  }

  bool get _isSolved {
    if (drawingColorId != null) return false;

    if (level.requireFullFill && !_isBoardFilledIfRequired()) return false;

    for (final p in level.pairs) {
      if (!_hasConnection(p.colorId)) return false;
    }

    return true;
  }

  bool _hasConnection(int colorId) {
    final pair = _pairForColor(colorId);
    if (pair == null) return false;

    final visited = <Point<int>>{};
    final stack = <Point<int>>[pair.a];

    while (stack.isNotEmpty) {
      final cur = stack.removeLast();
      if (cur == pair.b) return true;
      if (!visited.add(cur)) continue;

      final neigh = [
        Point(cur.x + 1, cur.y),
        Point(cur.x - 1, cur.y),
        Point(cur.x, cur.y + 1),
        Point(cur.x, cur.y - 1),
      ];

      for (final nb in neigh) {
        if (!_inBounds(nb)) continue;
        if (_getOcc(nb) == _blocked) continue;
        if (_getOcc(nb) != colorId) continue;
        if (!visited.contains(nb)) stack.add(nb);
      }
    }
    return false;
  }

  bool _isBoardFilledIfRequired() {
    if (!level.requireFullFill) return true;

    for (int x = 0; x < n; x++) {
      for (int y = 0; y < n; y++) {
        final v = boardOcc[x][y];
        if (v == _blocked) continue; // obstacles ignorés
        if (v == _empty) return false;
      }
    }
    return true;
  }

  Point<int>? _hitTestCell(Offset localPos, double boardSizePx) {
    final cellSize = boardSizePx / n;
    final x = (localPos.dx / cellSize).floor();
    final y = (localPos.dy / cellSize).floor();
    final cell = Point<int>(x, y);
    if (!_inBounds(cell)) return null;
    return cell;
  }

  void _startDrawingFrom(Point<int> cell) {
    final occ = _getOcc(cell);
    if (occ == _empty || occ == _blocked) return;

    final isSomeEndpoint = level.pairs.any(
      (p) =>
          (p.a == cell && p.colorId == occ) ||
          (p.b == cell && p.colorId == occ),
    );
    if (!isSomeEndpoint) return;

    drawingColorId = occ;
    _clearPath(occ);
    currentPath = [cell];
    setState(() {});
  }

  void _extendTo(Point<int> cell) {
    final cid = drawingColorId;
    if (cid == null) return;

    final last = currentPath.last;
    if (cell == last) return;

    final start = currentPath.first;
    if (_isEndpoint(last, cid) && last != start) return;

    // retour arrière
    if (currentPath.length >= 2 &&
        cell == currentPath[currentPath.length - 2]) {
      final removed = currentPath.removeLast();
      if (!_isEndpoint(removed, cid)) _setOcc(removed, _empty);
      setState(() {});
      return;
    }

    if (!isAdj(last, cell)) return;

    final occ = _getOcc(cell);
    if (occ == _blocked) return;
    if (occ != _empty) {
      // collision : on accepte seulement si c'est l'endpoint de la même couleur
      if (!(occ == cid && _isEndpoint(cell, cid))) return;
    }

    currentPath.add(cell);

    // on remplit la case si ce n'est pas un endpoint
    if (!_isEndpoint(cell, cid)) _setOcc(cell, cid);

    if (_isEndpoint(cell, cid) && cell != start) {
      paths[cid] = currentPath.where((c) => !_isEndpoint(c, cid)).toList();
      drawingColorId = null;
      currentPath = [];
      setState(() {});
      return;
    }

    setState(() {});
  }

  void _endDrawing() {
    final cid = drawingColorId;
    if (cid == null) return;

    final start = currentPath.isNotEmpty ? currentPath.first : null;
    final end = currentPath.isNotEmpty ? currentPath.last : null;

    final valid =
        start != null &&
        end != null &&
        _isEndpoint(start, cid) &&
        _isEndpoint(end, cid) &&
        start != end;

    if (!valid) {
      for (final cell in currentPath) {
        if (!_isEndpoint(cell, cid) && _getOcc(cell) == cid) {
          _setOcc(cell, _empty);
        }
      }
      paths[cid] = [];
    }

    drawingColorId = null;
    currentPath = [];
    setState(() {});
  }

  void _reset() => _loadLevel(levelIndex);

  // Récompense uniquement à la première complétion.
  // Solve utilisé → 0 coins. Hint utilisé → _baseReward / 2.
  Future<void> _rewardIfEligible() async {
    final alreadyCompleted = await GameProgress.isLevelCompleted(levelIndex);
    if (alreadyCompleted) return;

    await GameProgress.markLevelCompleted(levelIndex);

    if (_usedSolveThisLevel) {
      await _refreshWallet();
      return;
    }

    final reward = _usedHintThisLevel ? (_baseReward ~/ 2) : _baseReward;
    await GameProgress.addCoins(reward);
    await _refreshWallet();
  }

  Future<void> _goNext() async {
    if (!_isSolved) return;

    await _rewardIfEligible();

    final next = levelIndex + 1;
    if (next >= levels.length) {
      if (mounted) setState(() {});
      return;
    }

    await GameProgress.unlockLevel(next);
    unlockedLevel = await GameProgress.getUnlockedLevel();

    _loadLevel(next);
  }

  Future<void> _openLibrary() async {
    final picked = await Navigator.push<int>(
      context,
      MaterialPageRoute(
        builder: (_) => LevelsLibraryPage(
          totalLevels: levels.length,
          unlockedLevel: unlockedLevel,
          onPickLevel: (i) => Navigator.pop(context, i),
        ),
      ),
    );

    if (picked != null && picked <= unlockedLevel) {
      _loadLevel(picked);
    }

    unlockedLevel = await GameProgress.getUnlockedLevel();
    if (mounted) setState(() {});
  }

  Future<void> _openHelpShop() async {
    if (!mounted) return;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return SafeArea(
          top: false,
          child: StatefulBuilder(
            builder: (context, setModalState) {
              Future<void> refreshModal() async {
                await _refreshWallet();
                setModalState(() {});
              }

              Future<void> buy(_PowerType type) async {
                final price = (type == _PowerType.hint)
                    ? _hintPrice
                    : _solvePrice;

                final ok = await GameProgress.spendCoins(price);
                if (!ok) {
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Pas assez de coins 😅")),
                  );
                  return;
                }

                if (type == _PowerType.hint) {
                  await GameProgress.addHints(1);
                } else {
                  await GameProgress.addSolves(1);
                }

                await refreshModal();

                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      type == _PowerType.hint
                          ? "✅ Indice acheté (+1)"
                          : "✅ Solution achetée (+1)",
                    ),
                  ),
                );
              }

              return DraggableScrollableSheet(
                initialChildSize: 0.62,
                minChildSize: 0.40,
                maxChildSize: 0.92,
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.boardBg,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(22),
                      ),
                      border: Border.all(color: Colors.white12),
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: Container(
                              width: 44,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.circular(999),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),

                          Row(
                            children: [
                              const Icon(
                                Icons.shopping_bag_rounded,
                                color: AppColors.textPrimary,
                              ),
                              const SizedBox(width: 10),
                              const Expanded(
                                child: Text(
                                  "Aide du niveau",
                                  style: TextStyle(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              _CoinsPill(value: coins),
                            ],
                          ),

                          const SizedBox(height: 14),

                          _HelpBuyTile(
                            icon: Icons.lightbulb_rounded,
                            title: "Indice",
                            subtitle:
                                "Complète 1 couleur automatiquement.\n⚠️ Récompense divisée par 2 si tu réussis après.",
                            price: _hintPrice,
                            owned: hints,
                            enabled: coins >= _hintPrice,
                            onBuy: () => buy(_PowerType.hint),
                          ),

                          const SizedBox(height: 10),

                          _HelpBuyTile(
                            icon: Icons.auto_fix_high_rounded,
                            title: "Solution",
                            subtitle:
                                "Complète tout le niveau automatiquement.\n⚠️ Récompense = 0 pour ce niveau.",
                            price: _solvePrice,
                            owned: solves,
                            enabled: coins >= _solvePrice,
                            onBuy: () => buy(_PowerType.solve),
                          ),

                          const SizedBox(height: 12),

                          Text(
                            "Astuce : tu peux acheter ici puis utiliser les boutons en haut.",
                            style: TextStyle(
                              color: AppColors.textHint.withOpacity(0.95),
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );

    await _refreshWallet();
  }

  Future<bool> _ensureInventoryOrShop(_PowerType type) async {
    await _refreshWallet();
    final have = (type == _PowerType.hint) ? hints : solves;
    if (have > 0) return true;

    if (!mounted) return false;

    final price = (type == _PowerType.hint) ? _hintPrice : _solvePrice;
    final label = (type == _PowerType.hint) ? "indice" : "solution";

    final goShop = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Plus de $label"),
        content: Text(
          "Tu n'as plus de $label. Tu veux en acheter pour $price coins ?",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Non"),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Acheter"),
          ),
        ],
      ),
    );

    if (goShop != true) return false;

    await _openHelpShop();
    await _refreshWallet();

    final haveAfter = (type == _PowerType.hint) ? hints : solves;
    return haveAfter > 0;
  }

  /// Complète une couleur automatiquement (indice).
  Future<void> _useHintInGame() async {
    if (_usingPower) return;
    _usingPower = true;

    final has = await _ensureInventoryOrShop(_PowerType.hint);
    if (!has) {
      _usingPower = false;
      return;
    }

    final ok = await GameProgress.useHint();
    if (!ok) {
      _usingPower = false;
      return;
    }

    _usedHintThisLevel = true;

    int? pick;
    for (final p in level.pairs) {
      if (!_hasConnection(p.colorId)) {
        pick = p.colorId;
        break;
      }
    }
    pick ??= level.pairs.first.colorId;

    _hintColorId = pick;
    _applyColorSolution(pick);

    await _refreshWallet();
    if (mounted) setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    _hintColorId = null;
    _usingPower = false;
    setState(() {});
  }

  /// Complète tout le niveau automatiquement (solution).
  Future<void> _useSolveInGame() async {
    if (_usingPower) return;
    _usingPower = true;

    final has = await _ensureInventoryOrShop(_PowerType.solve);
    if (!has) {
      _usingPower = false;
      return;
    }

    final ok = await GameProgress.useSolve();
    if (!ok) {
      _usingPower = false;
      return;
    }

    _usedSolveThisLevel = true;

    for (final p in level.pairs) {
      _applyColorSolution(p.colorId);
    }

    await _refreshWallet();
    _usingPower = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final solved = _isSolved;
    final isLast = levelIndex >= levels.length - 1;
    final instruction = solved
        ? "Niveau complété"
        : (level.requireFullFill
              ? "Relie les points et remplis la grille"
              : "Relie les points sans croiser");

    return Scaffold(
      appBar: _GameAppBar(
        coins: coins,
        title: 'Niveau ${levelIndex + 1}/${levels.length}',
        hints: hints,
        solves: solves,
        onReset: _reset,
        onLibrary: _openLibrary,
        onHint: _useHintInGame,
        onSolve: _useSolveInGame,
        onShop: _openHelpShop,
      ),
      body: SafeArea(
        child: Container(
          color: AppColors.background,
          child: LayoutBuilder(
            builder: (context, c) {
              return Column(
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            instruction,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        _NextButton(enabled: solved && !isLast, onTap: _goNext),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  Expanded(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: min(c.maxWidth, 520),
                          maxHeight: min(c.maxHeight, 520),
                        ),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.boardBg.withOpacity(0.78),
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(color: AppColors.boardBorder),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 20,
                                  spreadRadius: 2,
                                  offset: Offset(0, 10),
                                  color: AppColors.boardShadow,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(22),
                              child: LayoutBuilder(
                                builder: (context, b) {
                                  final boardSize = min(
                                    b.maxWidth,
                                    b.maxHeight,
                                  ).toDouble();
                                  return GestureDetector(
                                    onPanStart: (d) {
                                      final cell = _hitTestCell(
                                        d.localPosition,
                                        boardSize,
                                      );
                                      if (cell == null) return;
                                      _startDrawingFrom(cell);
                                    },
                                    onPanUpdate: (d) {
                                      final cell = _hitTestCell(
                                        d.localPosition,
                                        boardSize,
                                      );
                                      if (cell == null) return;
                                      _extendTo(cell);
                                    },
                                    onPanEnd: (_) => _endDrawing(),
                                    child: CustomPaint(
                                      painter: _BoardPainter(
                                        n: n,
                                        pairs: level.pairs,
                                        palette: palette,
                                        occ: boardOcc,
                                        hintColorId: _hintColorId,
                                        blocked: level.blocked,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  _ConnectionsBar(
                    pairs: level.pairs,
                    palette: palette,
                    isConnected: _hasConnection,
                  ),

                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Astuce : recommence une couleur en touchant un de ses points.",
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textHint,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _GameAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int coins;
  final String title;
  final int hints;
  final int solves;

  final VoidCallback onReset;
  final VoidCallback onLibrary;
  final VoidCallback onHint;
  final VoidCallback onSolve;
  final VoidCallback onShop;

  const _GameAppBar({
    required this.coins,
    required this.title,
    required this.hints,
    required this.solves,
    required this.onReset,
    required this.onLibrary,
    required this.onHint,
    required this.onSolve,
    required this.onShop,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 36);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      elevation: 0,
      backgroundColor: AppColors.boardBg,
      title: const SizedBox.shrink(),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Center(child: _CoinsPill(value: coins)),
        ),
        IconButton(
          onPressed: onReset,
          icon: const Icon(Icons.restart_alt_rounded),
          tooltip: 'Reset',
        ),
        IconButton(
          onPressed: onLibrary,
          icon: const Icon(Icons.grid_view_rounded),
          tooltip: 'Bibliothèque',
        ),
        IconButton(
          onPressed: onHint,
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.lightbulb_rounded),
              Positioned(right: -6, top: -6, child: _CountBadge(value: hints)),
            ],
          ),
          tooltip: "Indice",
        ),
        IconButton(
          onPressed: onSolve,
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.auto_fix_high_rounded),
              Positioned(right: -6, top: -6, child: _CountBadge(value: solves)),
            ],
          ),
          tooltip: "Solution",
        ),
        IconButton(
          onPressed: onShop,
          icon: const Icon(Icons.shopping_bag_rounded),
          tooltip: "Aide / Acheter",
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(36),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

class _CoinsPill extends StatelessWidget {
  final int value;
  const _CoinsPill({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.stars_rounded,
            size: 16,
            color: AppColors.textPrimary,
          ),
          const SizedBox(width: 6),
          Text(
            "$value",
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ConnectionsBar extends StatelessWidget {
  final List<Pair> pairs;
  final List<Color> palette;
  final bool Function(int colorId) isConnected;

  const _ConnectionsBar({
    required this.pairs,
    required this.palette,
    required this.isConnected,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: SizedBox(
        height: 42,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const BouncingScrollPhysics(),
          itemCount: pairs.length,
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemBuilder: (context, i) {
            final p = pairs[i];
            final ok = isConnected(p.colorId);
            return _StatusChip(
              color: palette[p.colorId % palette.length],
              text: ok ? "" : "X",
              ok: ok,
            );
          },
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final Color color;
  final String text;
  final bool ok;

  const _StatusChip({
    required this.color,
    required this.text,
    required this.ok,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: AppColors.chipBg.withOpacity(0.80),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.chipBorder),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(0, 6),
            color: AppColors.chipShadow,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          if (ok) ...[
            const SizedBox(width: 6),
            const Icon(
              Icons.check_rounded,
              size: 16,
              color: AppColors.textPrimary,
            ),
          ],
        ],
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool enabled;

  const _NextButton({required this.onTap, required this.enabled});

  @override
  Widget build(BuildContext context) {
    final bg = enabled
        ? LinearGradient(colors: [AppColors.accent, AppColors.accent2])
        : LinearGradient(colors: [AppColors.surface2, AppColors.surface]);

    final fg = enabled ? AppColors.textPrimary : AppColors.textHint;
    return Opacity(
      opacity: enabled ? 1.0 : 0.55,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: bg,
          boxShadow: const [
            BoxShadow(
              color: Color(0x33000000),
              blurRadius: 14,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: enabled ? onTap : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_forward_rounded, size: 18, color: fg),
                  const SizedBox(width: 8),
                  Text(
                    "Suivant",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                      color: fg,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BoardPainter extends CustomPainter {
  final int n;
  final List<Pair> pairs;
  final List<Color> palette;
  final List<List<int>> occ;
  final int? hintColorId;
  final Set<Point<int>> blocked;

  _BoardPainter({
    required this.n,
    required this.pairs,
    required this.palette,
    required this.occ,
    required this.hintColorId,
    required this.blocked,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final cellSize = size.width / n;

    final gridPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = AppColors.grid;

    final blockPaint = Paint()..color = Colors.black.withOpacity(0.35);
    for (final b in blocked) {
      final rect = Rect.fromLTWH(
        b.x * cellSize,
        b.y * cellSize,
        cellSize,
        cellSize,
      ).deflate(cellSize * 0.10);

      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(cellSize * 0.18)),
        blockPaint,
      );
    }

    for (int i = 0; i <= n; i++) {
      canvas.drawLine(
        Offset(i * cellSize, 0),
        Offset(i * cellSize, size.height),
        gridPaint,
      );
      canvas.drawLine(
        Offset(0, i * cellSize),
        Offset(size.width, i * cellSize),
        gridPaint,
      );
    }

    for (int x = 0; x < n; x++) {
      for (int y = 0; y < n; y++) {
        final cid = occ[x][y];
        if (cid < 0) continue; // ignore empty + blocked

        final c = palette[cid % palette.length];
        final rect = Rect.fromLTWH(
          x * cellSize,
          y * cellSize,
          cellSize,
          cellSize,
        );
        final rrect = RRect.fromRectAndRadius(
          rect.deflate(cellSize * 0.12),
          Radius.circular(cellSize * 0.25),
        );

        final fill = Paint()..color = c.withOpacity(0.26);
        canvas.drawRRect(rrect, fill);
      }
    }

    for (final p in pairs) {
      final c = palette[p.colorId % palette.length];

      final isHint = (hintColorId != null && hintColorId == p.colorId);
      final ringPaint = Paint()
        ..color = AppColors.textPrimary.withOpacity(isHint ? 1.0 : 0.85)
        ..style = PaintingStyle.stroke
        ..strokeWidth = isHint ? 5 : 3;

      void drawDot(Point<int> cell) {
        final center = Offset(
          (cell.x + 0.5) * cellSize,
          (cell.y + 0.5) * cellSize,
        );

        final glowPaint = Paint()..color = c.withOpacity(isHint ? 0.30 : 0.22);
        final dotPaint = Paint()..color = c;

        canvas.drawCircle(center, cellSize * 0.34, glowPaint);
        canvas.drawCircle(center, cellSize * 0.20, dotPaint);
        canvas.drawCircle(center, cellSize * 0.27, ringPaint);
      }

      drawDot(p.a);
      drawDot(p.b);
    }
  }

  @override
  bool shouldRepaint(covariant _BoardPainter oldDelegate) {
    return oldDelegate.n != n ||
        oldDelegate.occ != occ ||
        oldDelegate.pairs != pairs ||
        oldDelegate.hintColorId != hintColorId ||
        oldDelegate.blocked != blocked;
  }
}

class _CountBadge extends StatelessWidget {
  final int value;
  const _CountBadge({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white12),
      ),
      child: Text(
        "$value",
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w900),
      ),
    );
  }
}

class _HelpBuyTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final int price;
  final int owned;
  final bool enabled;
  final VoidCallback onBuy;

  const _HelpBuyTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.owned,
    required this.enabled,
    required this.onBuy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white12),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white12),
            ),
            child: Icon(icon, color: AppColors.textPrimary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: Colors.white12),
                      ),
                      child: Text(
                        "x$owned",
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w900,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.textHint,
                    fontSize: 12,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton.icon(
                    onPressed: enabled ? onBuy : null,
                    icon: const Icon(
                      Icons.shopping_cart_checkout_rounded,
                      size: 18,
                    ),
                    label: Text("$price"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white10,
                      foregroundColor: AppColors.textPrimary,
                      disabledBackgroundColor: Colors.white10.withOpacity(0.25),
                      disabledForegroundColor: AppColors.textPrimary
                          .withOpacity(0.5),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                        side: const BorderSide(color: Colors.white12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
