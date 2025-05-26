// Importações dos pacotes principais
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Importações dos arquivos internos do projeto
import 'themes/app_themes.dart';         // Definição dos temas da aplicação
import 'themes/theme_manager.dart';      // Gerenciador de tema (claro/escuro)
import 'ui/pages/home_page.dart';        // Página inicial da aplicação

// Função principal que inicializa o app
void main() {
  runApp(
    // Provider responsável por gerenciar mudanças de tema (claro/escuro)
    ChangeNotifierProvider(
      create: (_) => ThemeManager(), // Instância do gerenciador de tema
      child: const NotreChefApp(),   // Widget raiz do aplicativo
    ),
  );
}

// Classe principal do app
class NotreChefApp extends StatelessWidget {
  const NotreChefApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtém a instância do ThemeManager para reagir às mudanças de tema
    final themeManager = Provider.of<ThemeManager>(context);

    return MaterialApp(
      title: 'NotreChef',                         // Nome do app
      theme: themeManager.themeData,               // Tema dinâmico (claro/escuro)
      home: const HomePage(),                      // Página inicial
      debugShowCheckedModeBanner: false,           // Remove a faixa de debug
    );
  }
}
