// 📄 lib/services/isar_service.dart

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/receita.dart';
import '../models/ingrediente.dart';

/// 🔧 Serviço responsável por inicializar, abrir, fechar e limpar o banco Isar.
class IsarService {
  /// 🗄️ Instância do banco Isar
  late Future<Isar> db;

  /// 🚀 Construtor - inicializa o banco ao criar o serviço
  IsarService() {
    db = openDB();
  }

  /// 🔑 Abre o banco Isar com os modelos definidos
  Future<Isar> openDB() async {
    // 📂 Obtém o diretório onde os dados serão armazenados
    final dir = await getApplicationDocumentsDirectory();

    // 🏛️ Abre o banco com as coleções
    return await Isar.open(
      [ReceitaSchema],
      directory: dir.path,
      inspector: true, // 🔍 Permite usar o Isar Inspector (web) para debug
    );
  }

  /// ❌ Fecha o banco manualmente (opcional)
  Future<void> closeDB() async {
    final instance = await db;
    await instance.close();
  }

  /// 🗑️ Apaga todos os dados de todas as coleções do banco
  Future<void> apagarTodosOsDados() async {
    final instance = await db;
    await instance.writeTxn(() async {
      await instance.receitas.clear(); // 🔥 Limpa todas as receitas (e os ingredientes embutidos)
      // 🔧 Se no futuro houver mais coleções, adicione aqui.
    });
  }
}
