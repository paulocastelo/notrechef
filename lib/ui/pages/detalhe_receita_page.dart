import 'package:flutter/material.dart';

// Importando nossos modelos e serviços
import '../../models/receita.dart';
import '../../services/isar_service.dart';
import '../../services/receita_service.dart';
import '../../utils/string_extensions.dart';

/// 📄 Tela que exibe os detalhes completos de uma receita
class DetalheReceitaPage extends StatefulWidget {
  const DetalheReceitaPage({super.key});

  @override
  State<DetalheReceitaPage> createState() => _DetalheReceitaPageState();
}

class _DetalheReceitaPageState extends State<DetalheReceitaPage> {
  // 🔧 Serviços
  late final IsarService isarService;
  late final ReceitaService receitaService;

  @override
  void initState() {
    super.initState();
    isarService = IsarService();
    receitaService = ReceitaService(isarService);
  }

  @override
  Widget build(BuildContext context) {
    // 📦 Obtém a receita passada como argumento
    final receita = ModalRoute.of(context)?.settings.arguments as Receita;

    return Scaffold(
      appBar: AppBar(
        title: Text(receita.nome),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'editar') {
                Navigator.pushNamed(
                  context,
                  '/form-receita',
                  arguments: receita,
                ).then((_) {
                  setState(() {}); // 🔄 Atualiza a tela ao voltar
                });
              } else if (value == 'excluir') {
                confirmarExclusao(receita);
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'editar',
                child: Text('Editar'),
              ),
              const PopupMenuItem(
                value: 'excluir',
                child: Text('Excluir'),
              ),
            ],
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [
            // 🏷️ Informações principais
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      receita.nome,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      receita.categoria.orDefault('Sem categoria'),
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.timer, size: 18),
                        const SizedBox(width: 4),
                        Text('${receita.tempoPreparo} min'),
                        const SizedBox(width: 16),
                        const Icon(Icons.restaurant, size: 18),
                        const SizedBox(width: 4),
                        Text(receita.rendimento.orDefault()),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // 📝 Descrição (se houver)
            if (receita.descricao.orDefault().isNotEmpty) ...[
              const Text(
                'Descrição',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(receita.descricao.orDefault('Sem descrição')),
              const SizedBox(height: 12),
            ],

            // 🧂 Ingredientes
            const Text(
              'Ingredientes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            ...receita.ingredientes.map(
                  (i) => ListTile(
                leading: const Icon(Icons.kitchen),
                title: Text(i.nome),
                subtitle: Text(
                  '${i.quantidade} ${i.unidade.orDefault()}',
                ),
              ),
            ),

            const SizedBox(height: 12),

            // 📖 Modo de Preparo
            const Text(
              'Modo de Preparo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(receita.modoPreparo.orDefault('Sem modo de preparo')),
          ],
        ),
      ),
    );
  }

  /// 🗑️ Confirmação antes de excluir
  void confirmarExclusao(Receita receita) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Excluir Receita'),
        content: const Text('Tem certeza que deseja excluir esta receita?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              await receitaService.removerReceita(receita.id);
              if (mounted) {
                Navigator.pop(context); // Fecha o diálogo
                Navigator.pop(context); // Volta para a HomePage
              }
            },
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
  }
}
