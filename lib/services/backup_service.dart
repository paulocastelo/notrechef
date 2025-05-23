// 📄 lib/services/backup_service.dart

import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';

import '../models/receita.dart';
import 'isar_service.dart';

/// 💾 Serviço responsável por backup (exportação) e restauração (importação) dos dados.
class BackupService {
  final IsarService _isarService;

  BackupService(this._isarService);

  /// 🚀 Exporta todas as receitas para um arquivo JSON
  Future<String> exportarBackup() async {
    final db = await _isarService.db;

    // 🔍 Pega todas as receitas
    final receitas = await db.receitas.where().findAll();

    // 🔄 Converte para JSON
    final List<Map<String, dynamic>> jsonList = receitas.map((r) => r.toJson()).toList();

    final jsonString = jsonEncode(jsonList);

    // 📂 Salva o JSON em um arquivo no diretório de documentos
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/notrechef_backup.json');

    await file.writeAsString(jsonString);

    return file.path; // Retorna o caminho do arquivo gerado
  }

  /// 🔁 Importa um backup a partir de um arquivo JSON
  Future<void> importarBackup() async {
    final db = await _isarService.db;

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/notrechef_backup.json');

    if (!await file.exists()) {
      throw Exception('Arquivo de backup não encontrado!');
    }

    final jsonString = await file.readAsString();
    final List<dynamic> jsonData = jsonDecode(jsonString);

    final List<Receita> receitas = jsonData
        .map((e) => Receita.fromJson(e as Map<String, dynamic>))
        .toList();

    // 🗑️ Limpa o banco antes de importar (opcional, pode ser customizado)
    await db.writeTxn(() async {
      await db.receitas.clear();
      await db.receitas.putAll(receitas);
    });
  }
}
