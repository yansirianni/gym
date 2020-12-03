import 'package:flutter/material.dart';
import 'package:gym/model/fichaMedicaModel.dart';
import 'package:gym/service/fichaMedicaService.dart';

class MedicoHomePage extends StatelessWidget {
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
                        "Médico",
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
                child: Text("Realizar Exame"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MedicoExamePage()),
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
            sizedBoxSpace,
          ],
        ),
      ),
    );
  }
}

class MedicoExamePage extends StatefulWidget {
  @override
  _MedicoExamePageState createState() => _MedicoExamePageState();
}

class _MedicoExamePageState extends State<MedicoExamePage> {
  FichaMedica fichaMedica = FichaMedica();

  final _exameFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const sizedBoxSpace = SizedBox(
      height: 24,
      width: 24,
    );
    return Material(
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(30.0),
            child: Form(
                key: _exameFormKey,
                child: Column(
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
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'CPF',
                      ),
                      onSaved: (String value) {
                        fichaMedica.cpf = value;
                      },
                    ),
                    sizedBoxSpace,
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Peso',
                      ),
                      onSaved: (String value) {
                        fichaMedica.peso = value;
                      },
                    ),
                    sizedBoxSpace,
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Altura',
                      ),
                      onSaved: (String value) {
                        fichaMedica.altura = value;
                      },
                    ),
                    sizedBoxSpace,
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Pressão',
                      ),
                      onSaved: (String value) {
                        fichaMedica.pressao = value;
                      },
                    ),
                    sizedBoxSpace,
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Gordura',
                      ),
                      onSaved: (String value) {
                        fichaMedica.gordura = value;
                      },
                    ),
                    sizedBoxSpace,
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Massa magra',
                      ),
                      onSaved: (String value) {
                        fichaMedica.massaMagra = value;
                      },
                    ),
                    sizedBoxSpace,
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Cliente aprovado?',
                      ),
                      onSaved: (String value) {
                        if (value == "sim") {
                          fichaMedica.aprovado = true;
                        } else {
                          fichaMedica.aprovado = false;
                        }
                      },
                    ),
                    sizedBoxSpace,
                    Container(
                      width: 200,
                      height: 50,
                      child: RaisedButton(
                        child: Text("Concluir Exame"),
                        onPressed: () async {
                          _exameFormKey.currentState.save();

                          print(fichaMedicaToJson(fichaMedica));

                          var response = await createFichaMedica(fichaMedica);

                          if (response.statusCode == 200) {
                            mostraBalaoConfirmacao(context);
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
                          }),
                    ),
                    sizedBoxSpace,
                  ],
                )),
          ),
        ],
      ),
    );
  }

  mostraBalaoConfirmacao(BuildContext context) {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Exame"),
      content: Text("Exame realizado com sucesso."),
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
