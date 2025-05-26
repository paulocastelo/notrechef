import 'package:flutter/material.dart';
import 'app_themes.dart';
import '../services/config_service.dart';

/// 🎛️ Gerencia o tema atual do app
class ThemeManager extends ChangeNotifier {
  late ThemeData _themeData;
  ThemeData get themeData => _themeData;

  final ConfigService _configService = ConfigService();

  ThemeManager() {
    _themeData = AppThemes.notebookTheme;
    _loadThemeFromDb();
  }

  /// 🔄 Carrega tema salvo no banco
  Future<void> _loadThemeFromDb() async {
    final config = await _configService.getConfig();

    _themeData =
        AppThemes.getThemeFromName(config.selectedTheme, config.isDarkMode);
    notifyListeners();
  }

  /// 🔥 Altera o tema e salva no banco
  Future<void> setTheme(String themeName) async {
    _themeData = AppThemes.getThemeFromName(themeName, false);
    await _configService.setTheme(themeName);
    notifyListeners();
  }

  /// 🌙 Alterna Dark Mode (para expansão futura)
  Future<void> toggleDarkMode(bool isDark) async {
    final config = await _configService.getConfig();
    _themeData = AppThemes.getThemeFromName(config.selectedTheme, isDark);
    await _configService.setDarkMode(isDark);
    notifyListeners();
  }
}
