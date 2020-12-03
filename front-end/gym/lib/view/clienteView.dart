import 'package:flutter/material.dart';
import 'package:gym/model/cadastroClienteModel.dart';
import 'package:gym/model/fichaMedicaModel.dart';
import 'package:gym/model/fichaMusculacaoModel.dart';
import 'package:gym/service/fichaMedicaService.dart';
import 'package:gym/service/fichaMusculacaoService.dart';

import '../constants.dart';

class ClientePage extends StatefulWidget {
  final CadastroCliente cliente;

  ClientePage({Key key, @required this.cliente}) : super(key: key);

  @override
  _ClientePageState createState() => _ClientePageState();
}

class _ClientePageState extends State<ClientePage> {
  @override
  Widget build(BuildContext context) {
    var cliente = widget.cliente;

    const sizedBoxSpace = SizedBox(
      height: 24,
      width: 24,
    );

    return Scaffold(
      body: Column(
        children: [
          sizedBoxSpace,
          Container(
            child: Row(
              children: [
                sizedBoxSpace,
                Container(
                  child: Center(
                    child: Text(
                      "Cliente: " + cliente.nome,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          sizedBoxSpace,
          Container(
            child: Column(
              children: [
                sizedBoxSpace,
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 50,
                        child: RaisedButton(
                          child: Text("Treino musculação"),
                          onPressed: () async {
                            var ficha = await getFichaMusculacao(cliente.cpf);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ClienteFichaMusculacao(ficha: ficha)),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                sizedBoxSpace,
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 50,
                        child: RaisedButton(
                          child: Text("Exame de Aptidão física"),
                          onPressed: () async {
                            var ficha = await getFichaMedica(cliente.cpf);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ClienteExameFisico(fichaMedica: ficha)),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                sizedBoxSpace,
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 50,
                        child: RaisedButton(
                          child: Text("Informações cadastrais"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ClienteFichaCadastral(
                                  cliente: widget.cliente,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                sizedBoxSpace,
              ],
            ),
          ),
          Container(
            width: 200,
            height: 50,
            child: RaisedButton(
              child: Text("Sair"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ClienteFichaMusculacao extends StatelessWidget {
  final List<FichaMusculacao> ficha;

  ClienteFichaMusculacao({Key key, @required this.ficha}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const sizedBoxSpace = SizedBox(
      height: 24,
      width: 24,
    );
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(30.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                "Lista de exercícios:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
            sizedBoxSpace,
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 150,
                    height: 50,
                    color: Colors.grey[600],
                    alignment: Alignment.center,
                    child: Text(
                      "Exercício",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 150,
                    height: 50,
                    color: Colors.grey[600],
                    alignment: Alignment.center,
                    child: Text(
                      "Músculos trabalhados",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 150,
                    height: 50,
                    color: Colors.grey[600],
                    alignment: Alignment.center,
                    child: Text(
                      "Repetições",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: ficha.length,
              itemBuilder: (BuildContext ctxt, int index) {
                final item = ficha[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      width: 150,
                      height: 50,
                      color: Colors.grey[350],
                      alignment: Alignment.center,
                      child: Text(item.exercicio),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      width: 150,
                      height: 50,
                      color: Colors.grey[350],
                      alignment: Alignment.center,
                      child: Text(item.musculos),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      width: 150,
                      height: 50,
                      color: Colors.grey[350],
                      alignment: Alignment.center,
                      child: Text(item.repeticoes),
                    ),
                  ],
                );
              },
            ),
            sizedBoxSpace,
            Container(
              alignment: Alignment.center,
              child: RaisedButton(
                child: Text("Voltar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClienteFichaCadastral extends StatelessWidget {
  final CadastroCliente cliente;

  ClienteFichaCadastral({Key key, @required this.cliente}) : super(key: key);

  final nomeTextController = TextEditingController();
  final cpfTextController = TextEditingController();
  final loginTextController = TextEditingController();
  final senhaTextController = TextEditingController();
  final identidadeTextController = TextEditingController();
  final dataTextController = TextEditingController();
  final cartaoTextController = TextEditingController();
  final titularTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const sizedBoxSpace = SizedBox(
      height: 24,
      width: 24,
    );

    nomeTextController.text = cliente.nome;
    cpfTextController.text = cliente.cpf;
    loginTextController.text = cliente.usuario;
    senhaTextController.text = cliente.senha;
    identidadeTextController.text = cliente.identidade;
    dataTextController.text = cliente.dataNascimento;
    cartaoTextController.text = cliente.cartao;
    titularTextController.text = cliente.titularCartao;

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                "Informações cadastrais",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
            sizedBoxSpace,
            TextField(
              controller: nomeTextController,
              decoration: InputDecoration(
                enabled: false,
                filled: true,
                labelText: 'Nome',
              ),
            ),
            sizedBoxSpace,
            TextFormField(
              controller: cpfTextController,
              decoration: InputDecoration(
                enabled: false,
                filled: true,
                labelText: 'CPF',
              ),
            ),
            sizedBoxSpace,
            TextFormField(
              controller: loginTextController,
              decoration: InputDecoration(
                enabled: false,
                filled: true,
                labelText: 'Login',
              ),
            ),
            sizedBoxSpace,
            TextFormField(
              controller: senhaTextController,
              decoration: InputDecoration(
                enabled: false,
                filled: true,
                labelText: 'Senha',
              ),
            ),
            sizedBoxSpace,
            TextFormField(
              controller: identidadeTextController,
              decoration: InputDecoration(
                enabled: false,
                filled: true,
                labelText: 'Identidade',
              ),
            ),
            sizedBoxSpace,
            TextFormField(
              controller: dataTextController,
              decoration: InputDecoration(
                enabled: false,
                filled: true,
                labelText: 'Data nascimento',
              ),
            ),
            sizedBoxSpace,
            TextFormField(
              controller: cartaoTextController,
              decoration: InputDecoration(
                enabled: false,
                filled: true,
                labelText: 'Numero do cartão',
              ),
            ),
            sizedBoxSpace,
            TextFormField(
              controller: titularTextController,
              decoration: InputDecoration(
                enabled: false,
                filled: true,
                labelText: 'Titular do cartão',
              ),
            ),
            sizedBoxSpace,
            Container(
              width: 200,
              height: 50,
              child: RaisedButton(
                child: Text("Voltar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClienteExameFisico extends StatelessWidget {
  final FichaMedica fichaMedica;

  ClienteExameFisico({Key key, @required this.fichaMedica}) : super(key: key);

  final pesoTextController = TextEditingController();
  final alturaTextController = TextEditingController();
  final pressaoTextController = TextEditingController();
  final gorduraTextController = TextEditingController();
  final massaMagraTextController = TextEditingController();
  final imcTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const sizedBoxSpace = SizedBox(
      height: 24,
      width: 24,
    );

    pesoTextController.text = fichaMedica.peso;
    alturaTextController.text = fichaMedica.altura;
    pressaoTextController.text = fichaMedica.pressao;
    gorduraTextController.text = fichaMedica.gordura;
    massaMagraTextController.text = fichaMedica.massaMagra;
    imcTextController.text = fichaMedica.imc;

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(30.0),
        alignment: Alignment.center,
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                "Exame médico",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
            sizedBoxSpace,
            TextFormField(
              controller: pesoTextController,
              decoration: InputDecoration(
                enabled: false,
                filled: true,
                labelText: 'Peso',
              ),
            ),
            sizedBoxSpace,
            TextFormField(
              controller: alturaTextController,
              decoration: InputDecoration(
                enabled: false,
                filled: true,
                labelText: 'Altura',
              ),
            ),
            sizedBoxSpace,
            TextFormField(
              controller: pressaoTextController,
              decoration: InputDecoration(
                enabled: false,
                filled: true,
                labelText: 'Pressão',
              ),
            ),
            sizedBoxSpace,
            TextFormField(
              controller: gorduraTextController,
              decoration: InputDecoration(
                enabled: false,
                filled: true,
                labelText: 'Gordura',
              ),
            ),
            sizedBoxSpace,
            TextFormField(
              controller: massaMagraTextController,
              decoration: InputDecoration(
                enabled: false,
                filled: true,
                labelText: 'Massa magra',
              ),
            ),
            sizedBoxSpace,
            TextFormField(
              controller: imcTextController,
              decoration: InputDecoration(
                enabled: false,
                filled: true,
                labelText: 'Indice de massa corporal (IMC)',
              ),
            ),
            sizedBoxSpace,
            Container(
              alignment: Alignment.center,
              child: Text(
                "Tabela IMC",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
            sizedBoxSpace,
            Container(
              alignment: Alignment.center,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: tabelaImc.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  final item = tabelaImc[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        width: 300,
                        height: 50,
                        color: Colors.grey[350],
                        alignment: Alignment.center,
                        child: Text(item.faixa),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        width: 300,
                        height: 50,
                        color: Colors.grey[350],
                        alignment: Alignment.center,
                        child: Text(item.situacao),
                      ),
                    ],
                  );
                },
              ),
            ),
            sizedBoxSpace,
            Container(
              width: 200,
              height: 50,
              child: RaisedButton(
                child: Text("Voltar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
