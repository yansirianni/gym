// To parse this JSON data, do
//
//     final tabelaImc = tabelaImcFromJson(jsonString);

import 'dart:convert';

List<TabelaImc> tabelaImcFromJson(String str) =>
    List<TabelaImc>.from(json.decode(str).map((x) => TabelaImc.fromJson(x)));

String tabelaImcToJson(List<TabelaImc> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TabelaImc {
  TabelaImc({
    this.faixa,
    this.situacao,
  });

  String faixa;
  String situacao;

  factory TabelaImc.fromJson(Map<String, dynamic> json) => TabelaImc(
        faixa: json["faixa"],
        situacao: json["situacao"],
      );

  Map<String, dynamic> toJson() => {
        "faixa": faixa,
        "situacao": situacao,
      };
}
