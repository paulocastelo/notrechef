import 'package:flutter/material.dart';
import 'theme_tokens.dart';

/// 🎨 🔥 Definição de todos os temas do NotreChef
class AppThemes {
  // ---------------------------------------------------------------------------
  // ✅ Theme 01 - Notebook (Claro)
  static final notebookTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: ThemeColors.notebookPrimary,
    scaffoldBackgroundColor: ThemeColors.notebookBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: ThemeColors.notebookPrimary,
      foregroundColor: Colors.white,
    ),
    cardColor: ThemeColors.notebookSurface,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ThemeColors.notebookAccent,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: ThemeColors.notebookText),
      bodyMedium: TextStyle(color: ThemeColors.notebookText),
      titleLarge: TextStyle(
        color: ThemeColors.notebookText,
        fontWeight: FontWeight.bold,
      ),
    ),
    useMaterial3: true,
  );

  // 🌙 Theme 01 - Notebook (Escuro)
  static final darkNotebookTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ThemeColors.notebookPrimary,
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: ThemeColors.notebookPrimary,
      foregroundColor: Colors.white,
    ),
    cardColor: const Color(0xFF1E1E1E),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ThemeColors.notebookAccent,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      titleLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    useMaterial3: true,
  );

  // ---------------------------------------------------------------------------
  // ✅ Theme 02 - Clean (Claro)
  static final cleanTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: ThemeColors.cleanPrimary,
    scaffoldBackgroundColor: ThemeColors.cleanBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: ThemeColors.cleanPrimary,
      foregroundColor: Colors.white,
    ),
    cardColor: ThemeColors.cleanSurface,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ThemeColors.cleanSecondary,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: ThemeColors.cleanText),
      bodyMedium: TextStyle(color: ThemeColors.cleanText),
      titleLarge: TextStyle(
        color: ThemeColors.cleanText,
        fontWeight: FontWeight.bold,
      ),
    ),
    useMaterial3: true,
  );

  // ---------------------------------------------------------------------------
  // ✅ Theme 03 - Gourmet (Escuro)
  static final gourmetTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ThemeColors.gourmetPrimary,
    scaffoldBackgroundColor: ThemeColors.gourmetBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: ThemeColors.gourmetBackground,
      foregroundColor: ThemeColors.gourmetPrimary,
    ),
    cardColor: ThemeColors.gourmetSurface,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ThemeColors.gourmetSecondary,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: ThemeColors.gourmetText),
      bodyMedium: TextStyle(color: ThemeColors.gourmetText),
      titleLarge: TextStyle(
        color: ThemeColors.gourmetPrimary,
        fontWeight: FontWeight.bold,
      ),
    ),
    useMaterial3: true,
  );

  // ---------------------------------------------------------------------------
  // 🚀 🔗 Métodos Auxiliares

  /// 🎯 Retorna o ThemeData com base no nome do tema e modo (claro/escuro)
  static ThemeData getThemeFromName(String themeName, bool isDarkMode) {
    switch (themeName) {
      case 'notebook':
        return isDarkMode ? darkNotebookTheme : notebookTheme;
      case 'clean':
        return cleanTheme; // Clean é só claro
      case 'gourmet':
        return gourmetTheme; // Gourmet é sempre escuro
      default:
        return isDarkMode ? darkNotebookTheme : notebookTheme;
    }
  }

  /// 🔄 Retorna o nome do tema com base no ThemeData atual
  static String getNameFromTheme(ThemeData themeData, bool isDarkMode) {
    if (themeData == (isDarkMode ? darkNotebookTheme : notebookTheme)) {
      return 'notebook';
    } else if (themeData == cleanTheme) {
      return 'clean';
    } else if (themeData == gourmetTheme) {
      return 'gourmet';
    } else {
      return 'notebook'; // fallback padrão
    }
  }
}
