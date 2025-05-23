import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Importando os serviços
import '../../services/backup_service.dart';
import '../../services/isar_service.dart';

/// ⚙️ Tela de configurações do app
class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  // 🔧 Serviços
  late final IsarService isarService;
  late final BackupService backupService;

  // 🎨 Estado do tema (claro ou escuro)
  bool temaEscuro = false;

  @override
  void initState() {
    super.initState();
    isarService = IsarService();
    backupService = BackupService(isarService);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: ListView(
        children: [
          // 🔽 Importar Backup
          ListTile(
            leading: const Icon(Icons.download),
            title: const Text('Importar Backup'),
            onTap: importarBackup,
          ),

          // 🔼 Exportar Backup
          ListTile(
            leading: const Icon(Icons.upload),
            title: const Text('Exportar Backup'),
            onTap: exportarBackup,
          ),

          // 🗑️ Apagar Todos os Dados
          ListTile(
            leading: const Icon(Icons.delete_forever, color: Colors.red),
            title: const Text('Apagar Todos os Dados'),
            onTap: confirmarApagarDados,
          ),

          const Divider(),

          // 🎨 Alternar Tema
          SwitchListTile(
            secondary: const Icon(Icons.dark_mode),
            title: const Text('Tema Escuro'),
            value: temaEscuro,
            onChanged: (value) {
              setState(() {
                temaEscuro = value;
              });
              alternarTema(value);
            },
          ),

          const Divider(),

          // ☕ Apoiar o Projeto
          ListTile(
            leading: const Icon(Icons.coffee),
            title: const Text('Apoie o Projeto ☕'),
            onTap: abrirLinkApoio,
          ),

          // ℹ️ Sobre o App → Agora abre uma tela dedicada
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Sobre'),
            onTap: () {
              Navigator.pushNamed(context, '/sobre');
            },
          ),
        ],
      ),
    );
  }

  /// 🔽 Importar backup de arquivo JSON
  void importarBackup() async {
    await backupService.importarBackup();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Backup importado com sucesso!')),
      );
    }
  }

  /// 🔼 Exportar backup para arquivo JSON
  void exportarBackup() async {
    final caminho = await backupService.exportarBackup();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Backup exportado em $caminho')),
      );
    }
  }

  /// 🗑️ Confirmar antes de apagar todos os dados
  void confirmarApagarDados() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Apagar Todos os Dados'),
        content: const Text(
          'Esta ação apagará todas as receitas cadastradas. '
              'Tem certeza que deseja continuar?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              await isarService.apagarTodosOsDados();
              if (mounted) {
                Navigator.pop(context); // Fecha o diálogo
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('🗑️ Todos os dados foram apagados do banco.')),
                );
              }
            },
            child: const Text('Apagar'),
          ),
        ],
      ),
    );
  }

  /// 🎨 Alterna entre tema claro e escuro (local)
  void alternarTema(bool escuro) {
    // ⚠️ Aqui fazemos de forma simplificada e local.
    // ✔️ Podemos melhorar no futuro com gerenciamento global via Provider.
    final brightness = escuro ? Brightness.dark : Brightness.light;
    final theme = Theme.of(context).copyWith(brightness: brightness);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => Theme(data: theme, child: const ConfiguracoesPage()),
      ),
    );
  }

  /// ☕ Abre o link de apoio no navegador
  void abrirLinkApoio() async {
    const url = 'https://www.buymeacoffee.com/seu_link_aqui';
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Não foi possível abrir o link.';
    }
  }
}
