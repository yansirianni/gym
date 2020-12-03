import 'package:flutter/material.dart';
import 'package:gym/model/cadastroClienteModel.dart';

import 'package:gym/service/cadastroService.dart';
import 'package:gym/service/fichaMedicaService.dart';

import '../constants.dart';

class SecretariaHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const sizedBoxSpace = SizedBox(
      height: 24,
      width: 24,
    );

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        "Secretária",
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
              width: 200,
              height: 50,
              child: RaisedButton(
                child: Text("Quadro de horário turmas"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecretariaQuadroHorariosPage()),
                  );
                },
              ),
            ),
            sizedBoxSpace,
            Container(
              width: 200,
              height: 50,
              child: RaisedButton(
                child: Text("Cadastrar cliente"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecretariaCadastroPage()),
                  );
                },
              ),
            ),
            sizedBoxSpace,
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
      ),
    );
  }
}

class SecretariaCadastroPage extends StatefulWidget {
  @override
  _SecretariaCadastroPageState createState() => _SecretariaCadastroPageState();
}

class _SecretariaCadastroPageState extends State<SecretariaCadastroPage> {
  CadastroCliente cadastroCliente = CadastroCliente();

  final _cadastroFormKey = GlobalKey<FormState>();
  final _buscaFormKey = GlobalKey<FormState>();

  final textController = TextEditingController();

  final textApprovedController = TextEditingController();

  String cpfCliente = "";

  @override
  Widget build(BuildContext context) {
    const sizedBoxSpace = SizedBox(
      height: 24,
      width: 24,
    );

    return Material(
      child: Container(
        margin: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            Text(
              "Cadastro do cliente",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            sizedBoxSpace,
            Form(
              key: _buscaFormKey,
              child: Container(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'CPF do cliente',
                      ),
                      onSaved: (String value) {
                        cpfCliente = value;
                      },
                    ),
                    sizedBoxSpace,
                    Container(
                      width: 200,
                      height: 50,
                      child: RaisedButton(
                        child: Text("Buscar CPF"),
                        onPressed: () async {
                          _buscaFormKey.currentState.save();

                          getCadastroCliente(cpfCliente).then(
                            (response) => {
                              setState(
                                () {
                                  getFichaMedica(cpfCliente).then(
                                    (exameResponse) => {
                                      setState(() {
                                        if (exameResponse != null) {
                                          textApprovedController.text =
                                              exameResponse.aprovado.toString();
                                        }
                                      })
                                    },
                                  );

                                  if (response != null) {
                                    cadastroCliente = response;
                                    textController.text = cadastroCliente.cpf;
                                  } else {
                                    mostraBalaoConfirmacao(
                                        context,
                                        "OK",
                                        "Cadastro",
                                        "Cliente não encontrado no sistema. Encaminhe para realização do exame médico.",
                                        "BAD");
                                  }
                                },
                              ),
                            },
                          );
                        },
                      ),
                    ),
                    sizedBoxSpace,
                  ],
                ),
              ),
            ),
            Form(
              key: _cadastroFormKey,
              child: Container(
                child: Column(
                  children: [
                    TextFormField(
                      controller: textApprovedController,
                      decoration: InputDecoration(
                        enabled: false,
                        filled: true,
                        labelText: 'Aprovado no exame médico?',
                      ),
                      onSaved: (String value) {},
                    ),
                    sizedBoxSpace,
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Nome',
                      ),
                      onSaved: (String value) {
                        cadastroCliente.nome = value;
                      },
                    ),
                    sizedBoxSpace,
                    TextFormField(
                      controller: textController,
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'CPF',
                      ),
                      onSaved: (String value) {
                        cadastroCliente.cpf = value;
                      },
                    ),
                    sizedBoxSpace,
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Login',
                      ),
                      onSaved: (String value) {
                        cadastroCliente.usuario = value;
                      },
                    ),
                    sizedBoxSpace,
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Senha',
                      ),
                      onSaved: (String value) {
                        cadastroCliente.senha = value;
                      },
                    ),
                    sizedBoxSpace,
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Identidade',
                      ),
                      onSaved: (String value) {
                        cadastroCliente.identidade = value;
                      },
                    ),
                    sizedBoxSpace,
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Data nascimento',
                      ),
                      onSaved: (String value) {
                        cadastroCliente.dataNascimento = value;
                      },
                    ),
                    sizedBoxSpace,
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Numero do cartão',
                      ),
                      onSaved: (String value) {
                        cadastroCliente.cartao = value;
                      },
                    ),
                    sizedBoxSpace,
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Titular do cartão',
                      ),
                      onSaved: (String value) {
                        cadastroCliente.titularCartao = value;
                      },
                    ),
                    sizedBoxSpace,
                    Container(
                      width: 200,
                      height: 50,
                      child: RaisedButton(
                        child: Text("Cadastrar cliente"),
                        onPressed: () async {
                          if (textApprovedController.text == "true") {
                            _cadastroFormKey.currentState.save();

                            print(cadastroClienteToJson(cadastroCliente));

                            var response =
                                await createCadastroCliente(cadastroCliente);

                            if (response.statusCode == 200) {
                              mostraBalaoConfirmacao(context, "OK", "Cadastro",
                                  "Cadastro realizado com sucesso.", "OK");
                            }
                          } else {
                            mostraBalaoConfirmacao(
                                context,
                                "OK",
                                "Cadastro",
                                "Cadastro não concluído! Cliente não foi aprovado no exame médico.",
                                "BAD");
                          }
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
            ),
          ],
        ),
      ),
    );
  }

  mostraBalaoConfirmacao(BuildContext context, String txtBtn, String txtTitle,
      String txtContent, String status) {
    // configura o button
    Widget okButton = FlatButton(
      child: Text(txtBtn),
      onPressed: () {
        if (status == "OK") {
          Navigator.pop(context);
          Navigator.pop(context);
        } else {
          Navigator.pop(context);
        }
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text(txtTitle),
      content: Text(txtContent),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}

class SecretariaQuadroHorariosPage extends StatelessWidget {
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
                "Tabela de Horários de aulas:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
            sizedBoxSpace,
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: horarios.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  final item = horarios[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        width: 100,
                        height: 50,
                        color: Colors.grey[600],
                        alignment: Alignment.center,
                        child: Text(
                          item.horario,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        width: 100,
                        height: 50,
                        color: Colors.grey[350],
                        alignment: Alignment.center,
                        child: Text(item.modSegunda),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        width: 100,
                        height: 50,
                        color: Colors.grey[350],
                        alignment: Alignment.center,
                        child: Text(item.modTerca),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        width: 100,
                        height: 50,
                        color: Colors.grey[350],
                        alignment: Alignment.center,
                        child: Text(item.modQuarta),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        width: 100,
                        height: 50,
                        color: Colors.grey[350],
                        alignment: Alignment.center,
                        child: Text(item.modQuinta),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        width: 100,
                        height: 50,
                        color: Colors.grey[350],
                        alignment: Alignment.center,
                        child: Text(item.modSexta),
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
