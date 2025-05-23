// 📄 lib/models/receita.dart

// Antes dos imports
import 'package:json_annotation/json_annotation.dart';
import 'package:isar/isar.dart';
import 'ingrediente.dart';


part 'receita.g.dart';

/// 🍽️ Representa uma receita culinária armazenada no banco local.
@collection
@JsonSerializable()
class Receita {
  /// 🔑 ID auto-incrementável gerenciado pelo Isar
  Id id = Isar.autoIncrement;

  /// 🔸 Nome da receita (ex.: Bolo de Cenoura)
  late String nome;

  /// 🔸 Descrição breve (ex.: Receita clássica de família)
  String? descricao;

  /// 🔸 Categoria (ex.: Sobremesa, Prato Principal)
  String? categoria;

  /// 🔸 Modo de preparo detalhado
  String? modoPreparo;

  /// 🔸 Tempo de preparo em minutos
  int? tempoPreparo;

  /// 🔸 Rendimento (ex.: 4 porções)
  String? rendimento;

  /// 🔸 Data de criação da receita
  DateTime dataCriacao = DateTime.now();

  /// 🔸 Data da última atualização
  DateTime dataAtualizacao = DateTime.now();

  /// 🧂 Lista de ingredientes da receita
  List<Ingrediente> ingredientes = [];

  Receita();

  // 🧠 Conversão para JSON
  factory Receita.fromJson(Map<String, dynamic> json) => _$ReceitaFromJson(json);
  Map<String, dynamic> toJson() => _$ReceitaToJson(this);

}
