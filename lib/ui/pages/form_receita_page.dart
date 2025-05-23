import 'package:flutter/material.dart';

/// 📝 Tela de formulário para criar ou editar uma receita
class FormReceitaPage extends StatefulWidget {
  const FormReceitaPage({super.key});

  @override
  State<FormReceitaPage> createState() => _FormReceitaPageState();
}

class _FormReceitaPageState extends State<FormReceitaPage> {
  /// 🔑 Chave do formulário
  final _formKey = GlobalKey<FormState>();

  // 🎯 Controllers para os campos de texto
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _categoriaController = TextEditingController();
  final TextEditingController _modoPreparoController = TextEditingController();
  final TextEditingController _tempoPreparoController = TextEditingController();
  final TextEditingController _rendimentoController = TextEditingController();

  @override
  void dispose() {
    // 🗑️ Libera os controllers da memória
    _nomeController.dispose();
    _descricaoController.dispose();
    _categoriaController.dispose();
    _modoPreparoController.dispose();
    _tempoPreparoController.dispose();
    _rendimentoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Receita'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              /// 🏷️ Nome da Receita
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome';
                  }
                  return null;
                },
              ),

              /// 📝 Descrição
              TextFormField(
                controller: _descricaoController,
                decoration: const InputDecoration(labelText: 'Descrição'),
                maxLines: 2,
              ),

              /// 📂 Categoria
              TextFormField(
                controller: _categoriaController,
                decoration: const InputDecoration(labelText: 'Categoria'),
              ),

              /// 🍳 Modo de Preparo
              TextFormField(
                controller: _modoPreparoController,
                decoration: const InputDecoration(labelText: 'Modo de Preparo'),
                maxLines: 4,
              ),

              /// ⏱️ Tempo de Preparo (minutos)
              TextFormField(
                controller: _tempoPreparoController,
                decoration: const InputDecoration(labelText: 'Tempo de Preparo (minutos)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o tempo de preparo';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Informe um número válido';
                  }
                  return null;
                },
              ),

              /// 🍽️ Rendimento
              TextFormField(
                controller: _rendimentoController,
                decoration: const InputDecoration(labelText: 'Rendimento'),
              ),

              const SizedBox(height: 24),

              /// 🔘 Botão Salvar
              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text('Salvar Receita'),
                onPressed: _salvarReceita,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 💾 Ação para salvar a receita
  void _salvarReceita() {
    if (_formKey.currentState!.validate()) {
      // 🎯 Aqui você processa os dados do formulário
      final nome = _nomeController.text;
      final descricao = _descricaoController.text;
      final categoria = _categoriaController.text;
      final modoPreparo = _modoPreparoController.text;
      final tempoPreparo = int.tryParse(_tempoPreparoController.text) ?? 0;
      final rendimento = _rendimentoController.text;

      // 🔥 Para este exemplo, vamos apenas imprimir no console:
      print('--- Receita Salva ---');
      print('Nome: $nome');
      print('Descrição: $descricao');
      print('Categoria: $categoria');
      print('Modo de Preparo: $modoPreparo');
      print('Tempo: $tempoPreparo minutos');
      print('Rendimento: $rendimento');

      // ✔️ Aqui você pode chamar seu service para salvar no banco

      // 🏁 Retornar para a tela anterior
      Navigator.pop(context);
    }
  }
}
