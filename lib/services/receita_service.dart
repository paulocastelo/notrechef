// 📄 lib/services/receita_service.dart

import 'package:isar/isar.dart';
import '../models/receita.dart';
import 'isar_service.dart';

/// 🔥 Serviço de manipulação de receitas (CRUD)
class ReceitaService {
  final IsarService _isarService;

  /// 🔗 Recebe uma instância de IsarService no construtor
  ReceitaService(this._isarService);

  /// ✅ Cadastrar uma nova receita
  Future<void> adicionarReceita(Receita receita) async {
    final db = await _isarService.db;
    await db.writeTxn(() => db.receitas.put(receita));
  }

  /// 🔍 Buscar todas as receitas
  Future<List<Receita>> listarReceitas() async {
    final db = await _isarService.db;
    return await db.receitas.where().sortByNome().findAll();
  }

  /// 🔍 Buscar uma receita específica pelo ID
  Future<Receita?> buscarPorId(int id) async {
    final db = await _isarService.db;
    return await db.receitas.get(id);
  }

  /// 🔍 Buscar receitas por nome (contém)
  Future<List<Receita>> buscarPorNome(String termo) async {
    final db = await _isarService.db;
    return await db.receitas
        .filter()
        .nomeContains(termo, caseSensitive: false)
        .findAll();
  }

  /// 📝 Atualizar uma receita existente
  Future<void> atualizarReceita(Receita receita) async {
    final db = await _isarService.db;
    receita.dataAtualizacao = DateTime.now();
    await db.writeTxn(() => db.receitas.put(receita));
  }

  /// ❌ Remover uma receita pelo ID
  Future<void> removerReceita(int id) async {
    final db = await _isarService.db;
    await db.writeTxn(() => db.receitas.delete(id));
  }

  /// ⚠️ Remover TODAS as receitas (cuidado!)
  Future<void> removerTodas() async {
    final db = await _isarService.db;
    await db.writeTxn(() => db.receitas.clear());
  }
}
