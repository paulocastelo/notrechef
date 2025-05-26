import 'package:flutter/material.dart';

// Importação das páginas
import 'ui/pages/home_page.dart';
import 'ui/pages/form_receita_page.dart';
import 'ui/pages/detalhe_receita_page.dart';
import 'ui/pages/configuracoes_page.dart';
import 'ui/pages/sobre_page.dart';

// Importação das rotas centralizadas
import 'app_routes.dart';

/// 🎨 Widget principal que configura tema, navegação e estrutura do app
class NotreChefApp extends StatelessWidget {
  const NotreChefApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NotreChef',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
        brightness: Brightness.light,
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
        brightness: Brightness.dark,
      ),

      themeMode: ThemeMode.system,

      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.formReceita: (context) => const FormReceitaPage(),
        AppRoutes.detalheReceita: (context) => const DetalheReceitaPage(), // ✅ Corrigido aqui
        AppRoutes.configuracoes: (context) => const ConfiguracoesPage(),
        AppRoutes.sobre: (context) => const SobrePage(),
      },
    );
  }
}
