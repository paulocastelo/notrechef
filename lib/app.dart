import 'package:flutter/material.dart';

// Importando as páginas
import 'ui/pages/home_page.dart';
import 'ui/pages/form_receita_page.dart';
import 'ui/pages/detalhe_receita_page.dart';
import 'ui/pages/configuracoes_page.dart';
import 'ui/pages/sobre_page.dart';

/// 🎨 Widget principal que configura o tema e as rotas
class NotreChefApp extends StatelessWidget {
  const NotreChefApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NotreChef',
      debugShowCheckedModeBanner: false,

      // 🔥 Tema claro
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
        brightness: Brightness.light,
      ),

      // 🌙 Tema escuro
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
        brightness: Brightness.dark,
      ),

      // 🎛️ Tema segue o sistema
      themeMode: ThemeMode.system,

      // 🔗 Rotas nomeadas
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/form-receita': (context) => const FormReceitaPage(),
        '/detalhe': (context) => const DetalheReceitaPage(),
        '/configuracoes': (context) => const ConfiguracoesPage(),
        '/sobre': (context) => const SobrePage(),
      },
    );
  }
}
