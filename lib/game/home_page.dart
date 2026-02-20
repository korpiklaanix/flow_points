import 'package:flutter/material.dart';
import 'package:flow_points/game/flow_game_page.dart';
import 'package:flow_points/game/progress/game_progress.dart';
import 'package:flow_points/game/levels/levels_library_page.dart';
import 'package:flow_points/game/data/levels.dart';
import 'package:flow_points/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int unlocked = 0;
  int coins = 0;
  int hints = 0;
  int solves = 0;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future<void> _refresh() async {
    unlocked = await GameProgress.getUnlockedLevel();
    coins = await GameProgress.getCoins();
    hints = await GameProgress.getHintCount();
    solves = await GameProgress.getSolveCount();
    if (mounted) setState(() {});
  }

  Future<void> _openGame({int? levelIndex}) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FlowGamePage(startLevelIndex: levelIndex ?? 0),
      ),
    );
    await _refresh();
  }

  Future<void> _openLibrary() async {
    final picked = await Navigator.push<int>(
      context,
      MaterialPageRoute(
        builder: (_) => LevelsLibraryPage(
          totalLevels: LevelsData.levels.length,
          unlockedLevel: unlocked,
          onPickLevel: (i) => Navigator.pop(context, i),
        ),
      ),
    );

    if (picked != null && picked <= unlocked) {
      await _openGame(levelIndex: picked);
    }
  }

  Future<void> _buy({
    required int price,
    required Future<void> Function(int n) addItem,
    required String okMsg,
  }) async {
    final ok = await GameProgress.spendCoins(price);
    if (!ok) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.surface,
          content: const Text("Pas assez de points 😅"),
        ),
      );
      return;
    }

    await addItem(1);
    await _refresh();

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: AppColors.surface, content: Text(okMsg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final total = LevelsData.levels.length;

    final filledBtnStyle = FilledButton.styleFrom(
      minimumSize: const Size.fromHeight(60),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: AppColors.accent,
      foregroundColor: AppColors.text,
    );

    final outlinedBtnStyle = OutlinedButton.styleFrom(
      minimumSize: const Size.fromHeight(60),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      foregroundColor: AppColors.accent,
      side: const BorderSide(color: AppColors.accent, width: 2),
    );

    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg,
        foregroundColor: AppColors.text,
        elevation: 0,
        title: const Text(
          "Flow Points",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        actions: [
          IconButton(
            tooltip: "Rafraîchir",
            onPressed: _refresh,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    title: "Points",
                    value: "$coins",
                    icon: Icons.stars_rounded,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _StatCard(
                    title: "Niveau",
                    value: "${unlocked + 1}/$total",
                    icon: Icons.grid_view_rounded,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _MiniInv(label: "Indices", value: hints),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _MiniInv(label: "Solutions", value: solves),
                ),
              ],
            ),

            const SizedBox(height: 18),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                style: filledBtnStyle,
                onPressed: () => _openGame(levelIndex: unlocked),
                label: const Text("Commencer"),
                icon: const Icon(Icons.play_arrow_rounded),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                style: outlinedBtnStyle,
                onPressed: _openLibrary,
                icon: const Icon(Icons.grid_view_rounded),
                label: const Text("Bibliothèque des niveaux"),
              ),
            ),

            const SizedBox(height: 22),

            Center(
              child: Text(
                "Boutique",
                style: const TextStyle(
                  color: AppColors.text,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.2,
                ),
              ),
            ),
            const SizedBox(height: 10),

            _ShopRow(
              title: "Indice (+1)",
              subtitle: "Surligne une couleur à commencer",
              price: 150,
              onBuy: () => _buy(
                price: 150,
                addItem: GameProgress.addHints,
                okMsg: "Indice ajouté ✅",
              ),
            ),
            _ShopRow(
              title: "Solution (+1)",
              subtitle: "Affiche une solution (niveau complet)",
              price: 400,
              onBuy: () => _buy(
                price: 400,
                addItem: GameProgress.addSolves,
                okMsg: "Solution ajoutée ✅",
              ),
            ),

            const Spacer(),
            const Text(
              "Astuce: tu gagnes des points quand tu réussis un niveau ✨",
              style: TextStyle(color: AppColors.textMuted),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Icon(icon, color: AppColors.accent),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: AppColors.textMuted)),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: AppColors.text,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MiniInv extends StatelessWidget {
  final String label;
  final int value;
  const _MiniInv({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface2,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: const TextStyle(color: AppColors.textMuted),
              ),
            ),
            Text(
              "$value",
              style: const TextStyle(
                color: AppColors.text,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ShopRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final int price;
  final VoidCallback onBuy;

  const _ShopRow({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.onBuy,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.text,
            fontWeight: FontWeight.w900,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: AppColors.textMuted),
        ),
        trailing: FilledButton(
          onPressed: onBuy,
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.accent2,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            textStyle: const TextStyle(fontWeight: FontWeight.w900),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text("$price"),
        ),
      ),
    );
  }
}
