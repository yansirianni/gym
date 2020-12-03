// To parse this JSON data, do
//
//     final tabelaHorarios = tabelaHorariosFromJson(jsonString);

import 'dart:convert';

List<TabelaHorarios> tabelaHorariosFromJson(String str) =>
    List<TabelaHorarios>.from(
        json.decode(str).map((x) => TabelaHorarios.fromJson(x)));

String tabelaHorariosToJson(List<TabelaHorarios> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TabelaHorarios {
  TabelaHorarios({
    this.horario,
    this.modSegunda,
    this.modTerca,
    this.modQuarta,
    this.modQuinta,
    this.modSexta,
  });

  String horario;
  String modSegunda;
  String modTerca;
  String modQuarta;
  String modQuinta;
  String modSexta;

  factory TabelaHorarios.fromJson(Map<String, dynamic> json) => TabelaHorarios(
        horario: json["horario"],
        modSegunda: json["modSegunda"],
        modTerca: json["modTerca"],
        modQuarta: json["modQuarta"],
        modQuinta: json["modQuinta"],
        modSexta: json["modSexta"],
      );

  Map<String, dynamic> toJson() => {
        "horario": horario,
        "modSegunda": modSegunda,
        "modTerca": modTerca,
        "modQuarta": modQuarta,
        "modQuinta": modQuinta,
        "modSexta": modSexta,
      };
}
