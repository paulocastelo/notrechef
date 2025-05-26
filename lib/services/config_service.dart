import 'package:isar/isar.dart';
import '../models/app_config.dart';
import 'isar_service.dart';

/// 🎯 Serviço responsável por gerenciar as configurações do app
class ConfigService {
  /// 👉 Instância do serviço de banco de dados
  final IsarService _isarService = IsarService();

  /// 🔍 Retorna a configuração atual, cria se não existir
  Future<AppConfig> getConfig() async {
    // Obtém a instância do banco
    final isar = await _isarService.db;

    // Busca a primeira configuração existente
    final config = await isar.appConfigs.where().findFirst();

    // Se não existir, cria uma nova configuração padrão
    if (config == null) {
      final novaConfig = AppConfig();
      await isar.writeTxn(() => isar.appConfigs.put(novaConfig));
      return novaConfig;
    }

    return config;
  }

  /// 🔄 Atualiza o tema selecionado
  Future<void> setTheme(String theme) async {
    final isar = await _isarService.db;

    final config = await getConfig();
    config.selectedTheme = theme;

    await isar.writeTxn(() => isar.appConfigs.put(config));
  }

  /// 🌙 Ativa ou desativa o modo escuro
  Future<void> setDarkMode(bool isDark) async {
    final isar = await _isarService.db;

    final config = await getConfig();
    config.isDarkMode = isDark;

    await isar.writeTxn(() => isar.appConfigs.put(config));
  }
}
