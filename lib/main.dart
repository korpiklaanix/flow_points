import 'package:flutter/material.dart';
import 'game/flow_game_page.dart';
import 'package:flow_points/game/home_page.dart';


void main() => runApp(const FlowPointsApp());

class FlowPointsApp extends StatelessWidget {
  const FlowPointsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flow Points',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.seed,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          foregroundColor: AppColors.textPrimary,
          centerTitle: true,
        ),
      ),
home: const HomePage(),
    );
  }
}
