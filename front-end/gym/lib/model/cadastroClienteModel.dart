// To parse this JSON data, do
//
//     final cadastroCliente = cadastroClienteFromJson(jsonString);

import 'dart:convert';

CadastroCliente cadastroClienteFromJson(String str) =>
    CadastroCliente.fromJson(json.decode(str));

String cadastroClienteToJson(CadastroCliente data) =>
    json.encode(data.toJson());

class CadastroCliente {
  CadastroCliente({
    this.usuario,
    this.senha,
    this.nome,
    this.cpf,
    this.identidade,
    this.dataNascimento,
    this.cartao,
    this.titularCartao,
  });

  String usuario;
  String senha;
  String nome;
  String cpf;
  String identidade;
  String dataNascimento;
  String cartao;
  String titularCartao;

  factory CadastroCliente.fromJson(Map<String, dynamic> json) =>
      CadastroCliente(
        usuario: json["usuario"],
        senha: json["senha"],
        nome: json["nome"],
        cpf: json["cpf"],
        identidade: json["identidade"],
        dataNascimento: json["dataNascimento"],
        cartao: json["cartao"],
        titularCartao: json["titularCartao"],
      );

  Map<String, dynamic> toJson() => {
        "usuario": usuario,
        "senha": senha,
        "nome": nome,
        "cpf": cpf,
        "identidade": identidade,
        "dataNascimento": dataNascimento,
        "cartao": cartao,
        "titularCartao": titularCartao,
      };
}
