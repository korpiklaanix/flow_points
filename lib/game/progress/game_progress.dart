import 'package:shared_preferences/shared_preferences.dart';

class GameProgress {
  static const _kUnlockedLevel = "unlockedLevel";
  static const _kCoins = "coins";

  static const _kHintCount = "hintCount";
  static const _kSolveCount = "solveCount";
  static const _kSkipCount = "skipCount";

  // niveaux complétés : empêche de regagner des coins en replay
  static const _kCompletedLevels = "completedLevels";

  static Future<int> getUnlockedLevel() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_kUnlockedLevel) ?? 0;
  }

  static Future<void> unlockLevel(int levelIndex) async {
    final prefs = await SharedPreferences.getInstance();
    final current = prefs.getInt(_kUnlockedLevel) ?? 0;
    if (levelIndex > current) {
      await prefs.setInt(_kUnlockedLevel, levelIndex);
    }
  }

  // ---------------- COMPLETED LEVELS ----------------

  static Future<Set<int>> getCompletedLevels() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_kCompletedLevels) ?? <String>[];
    return list.map(int.parse).toSet();
  }

  static Future<bool> isLevelCompleted(int levelIndex) async {
    final set = await getCompletedLevels();
    return set.contains(levelIndex);
  }

  static Future<void> markLevelCompleted(int levelIndex) async {
    final prefs = await SharedPreferences.getInstance();
    final set = await getCompletedLevels();
    if (set.add(levelIndex)) {
      await prefs.setStringList(
        _kCompletedLevels,
        set.map((e) => e.toString()).toList(),
      );
    }
  }

  // ---------------- COINS ----------------
  static Future<int> getCoins() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_kCoins) ?? 0;
  }

  static Future<void> addCoins(int amount) async {
    final prefs = await SharedPreferences.getInstance();
    final c = prefs.getInt(_kCoins) ?? 0;
    await prefs.setInt(_kCoins, c + amount);
  }

  static Future<bool> spendCoins(int amount) async {
    final prefs = await SharedPreferences.getInstance();
    final c = prefs.getInt(_kCoins) ?? 0;
    if (c < amount) return false;
    await prefs.setInt(_kCoins, c - amount);
    return true;
  }

  // ---------------- INVENTORY ----------------
  static Future<int> getHintCount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_kHintCount) ?? 0;
  }

  static Future<int> getSolveCount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_kSolveCount) ?? 0;
  }

  static Future<int> getSkipCount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_kSkipCount) ?? 0;
  }

  static Future<void> addHints(int n) async {
    final prefs = await SharedPreferences.getInstance();
    final v = prefs.getInt(_kHintCount) ?? 0;
    await prefs.setInt(_kHintCount, v + n);
  }

  static Future<void> addSolves(int n) async {
    final prefs = await SharedPreferences.getInstance();
    final v = prefs.getInt(_kSolveCount) ?? 0;
    await prefs.setInt(_kSolveCount, v + n);
  }

  static Future<void> addSkips(int n) async {
    final prefs = await SharedPreferences.getInstance();
    final v = prefs.getInt(_kSkipCount) ?? 0;
    await prefs.setInt(_kSkipCount, v + n);
  }

  static Future<bool> useHint() async {
    final prefs = await SharedPreferences.getInstance();
    final v = prefs.getInt(_kHintCount) ?? 0;
    if (v <= 0) return false;
    await prefs.setInt(_kHintCount, v - 1);
    return true;
  }

  static Future<bool> useSolve() async {
    final prefs = await SharedPreferences.getInstance();
    final v = prefs.getInt(_kSolveCount) ?? 0;
    if (v <= 0) return false;
    await prefs.setInt(_kSolveCount, v - 1);
    return true;
  }

  static Future<bool> useSkip() async {
    final prefs = await SharedPreferences.getInstance();
    final v = prefs.getInt(_kSkipCount) ?? 0;
    if (v <= 0) return false;
    await prefs.setInt(_kSkipCount, v - 1);
    return true;
  }

  // ---------------- RESET ----------------
  static Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt(_kUnlockedLevel, 0);
    await prefs.setInt(_kCoins, 0);
    await prefs.setInt(_kHintCount, 0);
    await prefs.setInt(_kSolveCount, 0);
    await prefs.setInt(_kSkipCount, 0);

    await prefs.remove(_kCompletedLevels);
  }
}
