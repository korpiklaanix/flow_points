import 'package:flutter/material.dart';
import 'package:flow_points/game/progress/game_progress.dart';

class LevelsLibraryPage extends StatelessWidget {
  final int totalLevels;
  final int unlockedLevel; // index max débloqué
  final void Function(int levelIndex) onPickLevel;

  const LevelsLibraryPage({
    super.key,
    required this.totalLevels,
    required this.unlockedLevel,
    required this.onPickLevel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Niveaux")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: totalLevels,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          itemBuilder: (context, i) {
            final isUnlocked = i <= unlockedLevel;

            return InkWell(
              onTap: isUnlocked ? () => onPickLevel(i) : null,
              borderRadius: BorderRadius.circular(16),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isUnlocked ? 1 : 0.35,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white12),
                    color: Colors.black26,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${i + 1}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Icon(
                          isUnlocked ? Icons.play_arrow_rounded : Icons.lock_rounded,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: OutlinedButton.icon(
          onPressed: () async {
            await GameProgress.reset();
            if (context.mounted) Navigator.pop(context, 0);
          },
          icon: const Icon(Icons.restart_alt_rounded),
          label: const Text("Réinitialiser la progression"),
        ),
      ),
    );
  }
}
