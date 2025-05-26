// 📄 lib/services/isar_service.dart

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/receita.dart';
import '../models/app_config.dart'; // ✅ Novo modelo adicionado

/// 🔧 Serviço responsável por inicializar, abrir, fechar e limpar o banco Isar.
class IsarService {
  /// 🗄️ Instância do banco Isar (Future para garantir inicialização assíncrona)
  late Future<Isar> db;

  /// 🚀 Construtor - inicializa o banco ao criar o serviço
  IsarService() {
    db = openDB();
  }

  /// 🔑 Abre o banco Isar com os modelos definidos
  Future<Isar> openDB() async {
    // 📂 Obtém o diretório onde os dados serão armazenados
    final dir = await getApplicationDocumentsDirectory();

    // 🏛️ Abre o banco com as coleções definidas
    return await Isar.open(
      [
        ReceitaSchema,      // 🍲 Coleção de receitas
        AppConfigSchema,    // ⚙️ Coleção para configurações do app
      ],
      directory: dir.path,
      inspector: true, // 🔍 Permite usar o Isar Inspector (web) para debug
    );
  }

  /// ✅ Getter para acesso simplificado à instância do banco
  Future<Isar> get isar => db;

  /// ❌ Fecha o banco manualmente (opcional)
  Future<void> closeDB() async {
    final instance = await db;
    await instance.close();
  }

  /// 🗑️ Apaga todos os dados de todas as coleções do banco
  Future<void> apagarTodosOsDados() async {
    final instance = await db;
    await instance.writeTxn(() async {
      await instance.receitas.clear();     // 🔥 Limpa todas as receitas
      await instance.appConfigs.clear();   // 🔥 Limpa todas as configurações
    });
  }
}
