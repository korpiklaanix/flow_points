import 'package:flutter/material.dart';
import 'package:flow_points/game/flow_game_page.dart';
import 'package:flow_points/game/progress/game_progress.dart';
import 'package:flow_points/game/levels/levels_library_page.dart';
import 'package:flow_points/game/data/levels.dart';

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
  int skips = 0;

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
    skips = await GameProgress.getSkipCount();
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
        const SnackBar(content: Text("Pas assez de points 😅")),
      );
      return;
    }
    await addItem(1);
    await _refresh();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(okMsg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final total = LevelsData.levels.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flow Points"),
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
            // Header stats
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
                Expanded(child: _MiniInv(label: "Indices", value: hints)),
                const SizedBox(width: 10),
                Expanded(child: _MiniInv(label: "Solutions", value: solves)),
                const SizedBox(width: 10),
                Expanded(child: _MiniInv(label: "Pass", value: skips)),
              ],
            ),

            const SizedBox(height: 18),

            // CTA
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => _openGame(levelIndex: unlocked),
                icon: const Icon(Icons.play_arrow_rounded),
                label: const Text("Commencer"),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _openLibrary,
                icon: const Icon(Icons.grid_view_rounded),
                label: const Text("Bibliothèque des niveaux"),
              ),
            ),

            const SizedBox(height: 22),

            // Shop (simple)
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Boutique",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 10),

            _ShopRow(
              title: "Indice (+1)",
              subtitle: "Surligne une couleur à commencer",
              price: 50,
              onBuy: () => _buy(
                price: 50,
                addItem: GameProgress.addHints,
                okMsg: "Indice ajouté ✅",
              ),
            ),
            _ShopRow(
              title: "Solution (+1)",
              subtitle: "Affiche une solution (niveau complet)",
              price: 200,
              onBuy: () => _buy(
                price: 200,
                addItem: GameProgress.addSolves,
                okMsg: "Solution ajoutée ✅",
              ),
            ),
            _ShopRow(
              title: "Passer un niveau (+1)",
              subtitle: "Débloque le niveau suivant",
              price: 300,
              onBuy: () => _buy(
                price: 300,
                addItem: GameProgress.addSkips,
                okMsg: "Pass ajouté ✅",
              ),
            ),

            const Spacer(),
            Text(
              "Astuce: tu gagnes des points quand tu réussis un niveau ✨",
              style: Theme.of(context).textTheme.bodySmall,
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
  const _StatCard({required this.title, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 4),
                Text(value, style: Theme.of(context).textTheme.titleLarge),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Expanded(child: Text(label)),
            Text("$value", style: const TextStyle(fontWeight: FontWeight.w800)),
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
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: FilledButton(
          onPressed: onBuy,
          child: Text("$price"),
        ),
      ),
    );
  }
}
