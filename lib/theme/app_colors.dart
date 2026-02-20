import 'package:flutter/material.dart';

class AppColors {
  // ============================================================
  // 🎀 Vintage Coral Scheme (adapté Flow Points)
  // ============================================================

  // Palette source
  static const sweetSalmon = Color.fromARGB(255, 180, 114, 109);
  static const desertSand = Color(0xFFE6B89C);
  static const wheat = Color(0xFFEAD2AC);
  static const coolSteel = Color(0xFF9CAFB7);
  static const steelBlue = Color(0xFF4281A4);

  // Seed Material
  static const seed = steelBlue;

  // ============================================================
  // 🌑 Background (plus foncé pour reposer les yeux)
  // ============================================================

  static const background = Color.fromARGB(
    255,
    20,
    29,
    33,
  ); // bleu gris profond

  // Texte
  static const textPrimary = Color.fromARGB(255, 255, 237, 209); // crème chaud
  static const textHint = Color.fromARGB(255, 255, 221, 199);

  // ============================================================
  // 🧱 Surfaces
  // ============================================================

  static const surface = Color(0xFF2F4753); // bleu acier profond
  static const surface2 = Color(0xFF3D5E6D); // un peu plus clair

  // ============================================================
  // 🎮 Game Board
  // ============================================================

  static const boardBg = Color(0xFF2B414C);
  static const boardBorder = Color(0xFF5E7F8F);
  static const grid = Color(0xFF446674);

  static const chipBg = Color(0xFF355563);
  static const chipBorder = Color(0xFF5E7F8F);

  static const boardShadow = Color(0x33000000);
  static const chipShadow = Color.fromARGB(30, 0, 0, 0);

  // ============================================================
  // 🎀 Accents
  // ============================================================

  // Bouton principal
  static const accent = sweetSalmon;

  // Prix / secondaire
  static const accent2 = Color.fromARGB(255, 180, 114, 109);

  // Accent doux secondaire
  static const accentSoft = desertSand;

  // ============================================================
  // 🎮 PALETTE ENDPOINTS (INCHANGÉE)
  // ============================================================

  static const palette = <Color>[
    Color(0xFFFE6F61),
    Color(0xFFFFC857),
    Color.fromARGB(255, 64, 180, 168),
    Color(0xFF4EA8DE),
    Color(0xFF3A86FF),
    Color(0xFF6A4C93),
    Color(0xFF43AA8B),
    Color(0xFF9B5DE5),
    Color(0xFFF15BB5),
    Color(0xFF5E6472),
  ];

  // Alias Home
  static const bg = background;
  static const text = textPrimary;
  static const textMuted = textHint;
}
