import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notrechef/app.dart';

void main() {
  group('NotreChef Widget Test', () {
    testWidgets('Verifica se a HomePage carrega corretamente',
            (WidgetTester tester) async {
          // 🔧 Monta o app
          await tester.pumpWidget(const NotreChefApp());

          // ✅ Verifica se o título da AppBar está presente
          expect(find.text('Minhas Receitas'), findsOneWidget);

          // ✅ Verifica se o botão de adicionar está presente
          expect(find.byIcon(Icons.add), findsOneWidget);

          // ✅ Verifica se o botão de configurações está presente
          expect(find.byIcon(Icons.settings), findsOneWidget);

          // ✅ Verifica se a mensagem de "Nenhuma receita cadastrada." aparece (estado inicial vazio)
          expect(find.text('Nenhuma receita cadastrada.'), findsOneWidget);
        });
  });
}
