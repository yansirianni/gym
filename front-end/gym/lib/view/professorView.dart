import 'package:flutter/material.dart';
import 'package:gym/model/fichaMusculacaoModel.dart';
import 'package:gym/service/fichaMusculacaoService.dart';

class ProfessorMainPage extends StatelessWidget {
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
                        "Professor",
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
              width: 250,
              height: 50,
              child: RaisedButton(
                child: Text("Dar aula"),
                onPressed: () {},
              ),
            ),
            sizedBoxSpace,
            Container(
              width: 250,
              height: 50,
              child: RaisedButton(
                child: Text("Cadastrar ficha musculação"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfessorFichaMusculacaoPage()),
                  );
                },
              ),
            ),
            sizedBoxSpace,
            Container(
              width: 250,
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

// ignore: must_be_immutable
class ProfessorFichaMusculacaoPage extends StatefulWidget {
  var ficha = new List<FichaMusculacao>();

  ProfessorFichaMusculacaoPage() {
    ficha = [];
  }

  @override
  _ProfessorFichaMusculacaoPageState createState() =>
      _ProfessorFichaMusculacaoPageState();
}

class _ProfessorFichaMusculacaoPageState
    extends State<ProfessorFichaMusculacaoPage> {
  var cpfCtrl = new TextEditingController();
  var exercicioCtrl = new TextEditingController();
  var musculosCtrl = new TextEditingController();
  var repeticoesCtrl = new TextEditingController();

  final _fichaFormKey = GlobalKey<FormState>();

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
            Form(
              key: _fichaFormKey,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Cadastro da ficha de musculação",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                  ),
                  sizedBoxSpace,
                  TextFormField(
                    controller: cpfCtrl,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'CPF do aluno:',
                    ),
                    onSaved: (String value) {},
                  ),
                  sizedBoxSpace,
                  TextFormField(
                    controller: exercicioCtrl,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Nome do exercicio',
                    ),
                    onSaved: (String value) {},
                  ),
                  sizedBoxSpace,
                  TextFormField(
                    controller: musculosCtrl,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Musculos afetados',
                    ),
                    onSaved: (String value) {},
                  ),
                  sizedBoxSpace,
                  TextFormField(
                    controller: repeticoesCtrl,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Número de repetições',
                    ),
                    onSaved: (String value) {},
                  ),
                  sizedBoxSpace,
                  Container(
                    width: 200,
                    height: 50,
                    child: RaisedButton(
                      child: Text("Adicionar Exercicio"),
                      onPressed: () {
                        _fichaFormKey.currentState.save();

                        setState(() {
                          if (cpfCtrl.text.isEmpty) {
                            return;
                          }
                          widget.ficha.add(
                            FichaMusculacao(
                              cpfCliente: cpfCtrl.text,
                              exercicio: exercicioCtrl.text,
                              musculos: musculosCtrl.text,
                              repeticoes: repeticoesCtrl.text,
                            ),
                          );
                          exercicioCtrl.text = "";
                          musculosCtrl.text = "";
                          repeticoesCtrl.text = "";
                          //save();
                        });
                      },
                    ),
                  ),
                  sizedBoxSpace,
                ],
              ),
            ),
            Text(
              "Exercicios Cadastrados: ",
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            sizedBoxSpace,
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.ficha.length,
              itemBuilder: (BuildContext ctxt, int index) {
                final item = widget.ficha[index];
                return Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      width: 100,
                      height: 50,
                      color: Colors.grey[350],
                      alignment: Alignment.center,
                      child: Text(item.exercicio),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      width: 100,
                      height: 50,
                      color: Colors.grey[350],
                      alignment: Alignment.center,
                      child: Text(item.musculos),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      width: 100,
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
              width: 200,
              height: 50,
              child: RaisedButton(
                child: Text("Confirmar ficha"),
                onPressed: () async {
                  var response = await createFichaMusculacao(widget.ficha);

                  if (response.statusCode == 200) {
                    mostraBalaoConfirmacao(context, "OK", "Ficha",
                        "Ficha cadastrada com sucesso.", "OK");
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
