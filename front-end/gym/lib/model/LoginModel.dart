// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.usuario,
    this.senha,
  });

  String usuario;
  String senha;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        usuario: json["usuario"],
        senha: json["senha"],
      );

  Map<String, dynamic> toJson() => {
        "usuario": usuario,
        "senha": senha,
      };
}
