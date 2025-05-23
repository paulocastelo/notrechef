// 📄 lib/lab/lad_main.dart

import 'package:flutter/material.dart';
import 'package:notrechef/models/ingrediente.dart';
import 'package:notrechef/services/isar_service.dart';
import 'package:notrechef/models/receita.dart';
import 'package:notrechef/services/receita_service.dart';
import 'package:notrechef/services/backup_service.dart';

void main() async {
  // 🏁 Garante que o Flutter esteja inicializado
  WidgetsFlutterBinding.ensureInitialized();

  // 🚀 Inicializa os serviços
  final isarService = IsarService();
  final receitaService = ReceitaService(isarService);
  final backupService = BackupService(isarService);

  // 🧪 ⬇️ Aqui começam os testes

  // 🔸 1. Criar uma nova receita
  final receita = Receita()
    ..nome = 'Bolo de Cenoura'
    ..descricao = 'Bolo fofinho com cobertura de chocolate'
    ..categoria = 'Sobremesa'
    ..modoPreparo = 'Misture os ingredientes, asse por 40 minutos.'
    ..tempoPreparo = 60
    ..rendimento = '8 porções'
    ..ingredientes = [
      Ingrediente()
        ..nome = 'Cenoura'
        ..quantidade = 3
        ..unidade = 'unidades',
      Ingrediente()
        ..nome = 'Farinha'
        ..quantidade = 2.5
        ..unidade = 'xícaras',
      Ingrediente()
        ..nome = 'Açúcar'
        ..quantidade = 2
        ..unidade = 'xícaras',
      Ingrediente()
        ..nome = 'Ovo'
        ..quantidade = 4
        ..unidade = 'unidades',
    ];

  await receitaService.adicionarReceita(receita);
  print('✅ Receita adicionada com sucesso.');

  // 🔸 2. Listar todas as receitas
  final receitas = await receitaService.listarReceitas();
  print('\n📃 Lista de receitas:');
  for (var r in receitas) {
    print('- ${r.nome} (ID: ${r.id})');
  }

  // 🔸 3. Buscar receita por nome
  final busca = await receitaService.buscarPorNome('Bolo');
  print('\n🔍 Busca por "Bolo":');
  for (var r in busca) {
    print('- ${r.nome}');
  }

  // 🔸 4. Atualizar uma receita
  if (receitas.isNotEmpty) {
    final r = receitas.first;
    r.descricao = 'Bolo de Cenoura atualizado com nova descrição';
    await receitaService.atualizarReceita(r);
    print('✍️ Receita atualizada com sucesso.');
  }

  // 🔸 5. Exportar backup
  final caminhoBackup = await backupService.exportarBackup();
  print('\n💾 Backup exportado em: $caminhoBackup');

  // 🔸 6. Deletar todas as receitas
  await receitaService.removerTodas();
  print('🗑️ Todas as receitas foram removidas.');

  // 🔸 7. Importar backup
  await backupService.importarBackup();
  print('♻️ Backup restaurado com sucesso.');

  // 🔸 8. Confirmar que os dados foram restaurados
  final receitasRestauradas = await receitaService.listarReceitas();
  print('\n📦 Receitas após restauração:');
  for (var r in receitasRestauradas) {
    print('- ${r.nome} (ID: ${r.id})');
  }

  // 🔚 Fecha o banco
  await isarService.closeDB();
  print('\n🚀 Finalizado com sucesso!');

  // 🏳️ Fecha o app (não precisa rodar interface, isso é apenas teste)
}
