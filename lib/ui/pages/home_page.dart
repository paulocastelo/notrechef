import 'package:flutter/material.dart';

// Importando nossos modelos e serviços
import '../../models/receita.dart';
import '../../services/isar_service.dart';
import '../../services/receita_service.dart';
import '../../utils/string_extensions.dart';

/// 🏠 HomePage → Tela principal do app, exibe a lista de receitas cadastradas.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 🔧 Serviços que manipulam banco de dados e receitas
  late final IsarService isarService;
  late final ReceitaService receitaService;

  // 📦 Lista que armazenará as receitas carregadas do banco
  List<Receita> listaReceitas = [];

  @override
  void initState() {
    super.initState();
    // 🔌 Inicializando os serviços
    isarService = IsarService();
    receitaService = ReceitaService(isarService);

    // 🚀 Carregando as receitas quando a tela inicializa
    carregarReceitas();
  }

  /// 🔄 Método que busca as receitas no banco e atualiza a interface
  Future<void> carregarReceitas() async {
    final receitas = await receitaService.listarReceitas();
    setState(() {
      listaReceitas = receitas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🔝 Barra superior da tela
      appBar: AppBar(
        title: const Text('Minhas Receitas'),
        actions: [
          // ⚙️ Botão que leva para a tela de configurações
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/configuracoes');
            },
          ),
        ],
      ),

      // 📜 Corpo da tela → Lista de receitas ou mensagem de vazio
      body: listaReceitas.isEmpty
          ? const Center(
        child: Text('Nenhuma receita cadastrada.'),
      )
          : ListView.builder(
        itemCount: listaReceitas.length,
        itemBuilder: (context, index) {
          final receita = listaReceitas[index];

          return Card(
            margin: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 6),
            child: ListTile(
              // 🍽️ Ícone que representa uma receita
              leading: const Icon(Icons.restaurant_menu),

              // 🏷️ Nome da receita
              title: Text(receita.nome),

              // 🗂️ Categoria da receita (ou texto padrão)
              subtitle: Text(
                receita.categoria.orDefault('Sem categoria'),
              ),

              // ➡️ Ícone de seta
              trailing: const Icon(Icons.arrow_forward_ios),

              // 👉 Ao tocar, navega para a página de detalhes
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/detalhe',
                  arguments: receita, // Passa a receita como argumento
                ).then((_) {
                  // 🔄 Ao voltar da página de detalhe, recarrega a lista
                  carregarReceitas();
                });
              },
            ),
          );
        },
      ),

      // ➕ Botão flutuante para adicionar uma nova receita
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/form-receita',
          ).then((_) {
            // 🔄 Ao voltar do formulário, recarrega a lista
            carregarReceitas();
          });
        },
        child: const Icon(Icons.add), // Ícone de +
      ),
    );
  }
}
