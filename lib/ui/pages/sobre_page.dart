import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// ℹ️ Tela de informações sobre o app e links de apoio
class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

  // 🔗 URLs de apoio (substitua pelos seus links reais)
  static const String urlAbacashi = 'https://abacashi.com/p/seu-link';
  static const String urlKoFi = 'https://ko-fi.com/seu-link';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre o App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // 🏷️ Nome e versão do app
            const Text(
              'NotreChef',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Versão 1.0.0',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 24),

            // 💙 Texto de agradecimento
            const Text(
              'Se você gosta do que faço e quer apoiar este projeto, '
                  'pode contribuir com qualquer valor. Sua ajuda faz toda a diferença! 💙',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 16),

            // 🔸 Botão de apoio no Brasil
            ElevatedButton.icon(
              onPressed: () => abrirLink(urlAbacashi),
              icon: const Icon(Icons.favorite),
              label: const Text('Apoiar no Brasil (Abacashi)'),
            ),

            const SizedBox(height: 8),

            // 🌎 Texto internacional
            const Text(
              'If you’re outside Brazil and would like to support my work, '
                  'you can buy me a virtual coffee on Ko-fi! ☕ Thank you for your support!',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 16),

            // 🔸 Botão internacional
            ElevatedButton.icon(
              onPressed: () => abrirLink(urlKoFi),
              icon: const Icon(Icons.coffee),
              label: const Text('Buy me a Coffee (International)'),
            ),

            const SizedBox(height: 24),

            // ℹ️ Créditos
            const Divider(),
            const Text(
              'Desenvolvido por Paulo Anderson Oliveira Castelo\n'
                  '© 2025 Todos os direitos reservados.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// 🔗 Abre o link no navegador
  static void abrirLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Não foi possível abrir o link: $url';
    }
  }
}

