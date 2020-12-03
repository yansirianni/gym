// To parse this JSON data, do
//
//     final fichaMusculacao = fichaMusculacaoFromJson(jsonString);

import 'dart:convert';

List<FichaMusculacao> listFichaMusculacaoFromJson(String str) =>
    List<FichaMusculacao>.from(
        json.decode(str).map((x) => FichaMusculacao.fromJson(x)));

FichaMusculacao fichaMusculacaoFromJson(String str) =>
    FichaMusculacao.fromJson(json.decode(str));

String fichaMusculacaoToJson(FichaMusculacao data) =>
    json.encode(data.toJson());

class FichaMusculacao {
  FichaMusculacao({
    this.cpfCliente,
    this.exercicio,
    this.musculos,
    this.repeticoes,
  });

  String cpfCliente;
  String exercicio;
  String musculos;
  String repeticoes;

  factory FichaMusculacao.fromJson(Map<String, dynamic> json) =>
      FichaMusculacao(
        cpfCliente: json["cpfCliente"],
        exercicio: json["exercicio"],
        musculos: json["musculos"],
        repeticoes: json["repeticoes"],
      );

  Map<String, dynamic> toJson() => {
        "cpfCliente": cpfCliente,
        "exercicio": exercicio,
        "musculos": musculos,
        "repeticoes": repeticoes,
      };
}
