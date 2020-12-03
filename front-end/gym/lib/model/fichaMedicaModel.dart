// To parse this JSON data, do
//
//     final fichaMedica = fichaMedicaFromJson(jsonString);

import 'dart:convert';

FichaMedica fichaMedicaFromJson(String str) =>
    FichaMedica.fromJson(json.decode(str));

String fichaMedicaToJson(FichaMedica data) => json.encode(data.toJson());

class FichaMedica {
  FichaMedica({
    this.cpf,
    this.peso,
    this.altura,
    this.pressao,
    this.gordura,
    this.massaMagra,
    this.imc,
    this.aprovado,
  });

  String cpf;
  String peso;
  String altura;
  String pressao;
  String gordura;
  String massaMagra;
  String imc;
  bool aprovado;

  factory FichaMedica.fromJson(Map<String, dynamic> json) => FichaMedica(
        cpf: json["cpf"],
        peso: json["peso"],
        altura: json["altura"],
        pressao: json["pressao"],
        gordura: json["gordura"],
        massaMagra: json["massaMagra"],
        imc: json["imc"],
        aprovado: json["aprovado"],
      );

  Map<String, dynamic> toJson() => {
        "cpf": cpf,
        "peso": peso,
        "altura": altura,
        "pressao": pressao,
        "gordura": gordura,
        "massaMagra": massaMagra,
        "imc": imc,
        "aprovado": aprovado,
      };
}
