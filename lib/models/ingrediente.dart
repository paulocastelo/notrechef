// 📄 lib/models/ingrediente.dart

import 'package:json_annotation/json_annotation.dart';
import 'package:isar/isar.dart';

part 'ingrediente.g.dart';

/// 🧂 Representa um ingrediente dentro de uma receita.
/// Este modelo é EMBUTIDO na Receita, não é uma coleção separada.
@embedded
@JsonSerializable()
class Ingrediente {
  /// 🔸 Nome do ingrediente (ex.: Farinha, Leite)
  late String nome;

  /// 🔸 Quantidade (ex.: 2.5)
  late double quantidade;

  /// 🔸 Unidade de medida (ex.: xícaras, gramas)
  late String unidade;

  Ingrediente();

  // 🧠 Conversão para JSON
  factory Ingrediente.fromJson(Map<String, dynamic> json) => _$IngredienteFromJson(json);

}
