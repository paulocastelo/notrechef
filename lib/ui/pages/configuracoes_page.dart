import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../themes/theme_manager.dart';
import '../../themes/app_themes.dart';

/// 🛠️ Tela de Configurações do app NotreChef
/// Permite selecionar o tema (Notebook, Clean ou Gourmet)
class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

/// 🧠 Estado da tela de configurações
class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  late String temaSelecionado;

  @override
  void initState() {
    super.initState();
    final themeManager = Provider.of<ThemeManager>(context, listen: false);
    temaSelecionado = _obterTemaAtual(themeManager);
  }

  /// 🎯 Função auxiliar que retorna o nome do tema atualmente aplicado
  String _obterTemaAtual(ThemeManager themeManager) {
    const temas = ['notebook', 'clean', 'gourmet'];
    for (var tema in temas) {
      if (themeManager.themeData ==
          AppThemes.getThemeFromName(tema, false)) {
        return tema;
      }
    }
    return 'notebook'; // fallback padrão
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Seleção de Tema',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            _radioButton('Notebook', themeManager),
            _radioButton('Clean', themeManager),
            _radioButton('Gourmet', themeManager),

            // 🔜 Aqui pode adicionar futuramente o controle de Dark Mode
          ],
        ),
      ),
    );
  }

  /// 🔘 Widget que constrói cada opção de tema
  Widget _radioButton(String label, ThemeManager themeManager) {
    return RadioListTile<String>(
      title: Text(label),
      value: label.toLowerCase(),
      groupValue: temaSelecionado,
      onChanged: (value) {
        if (value != null) {
          themeManager.setTheme(value);
          setState(() => temaSelecionado = value);
        }
      },
    );
  }
}
