import 'package:flutter/material.dart';
import 'package:gym/model/LoginModel.dart';
import 'package:gym/service/cadastroService.dart';

import 'clienteView.dart';
import 'medicoView.dart';
import 'professorView.dart';
import 'secretariaView.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TelaLogin(),
    );
  }
}

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  var login = Login();
  //requiring the list of todos

  final _loginFormKey = GlobalKey<FormState>();

  final List<String> _tipoLogin = [
    "Cliente",
    "Medico",
    "Professor",
    "Secretaria"
  ];

  var _tipoLoginSelecionado = "Cliente";

  @override
  Widget build(BuildContext context) {
    const sizedBoxSpace = SizedBox(
      height: 24,
      width: 24,
    );

    var login = Login();

    return Container(
      margin: const EdgeInsets.fromLTRB(750, 10, 750, 10),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              "Academia",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          sizedBoxSpace,
          Form(
            key: _loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Login',
                  ),
                  onSaved: (String value) {
                    login.usuario = value;
                  },
                ),
                sizedBoxSpace,
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Senha',
                  ),
                  onSaved: (String value) {
                    login.senha = value;
                  },
                  obscureText: true,
                ),
                sizedBoxSpace,
                Text(
                  "Escolha o tipo de usuário:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                //sizedBoxSpace,
                tipoDropDownButton(),
                sizedBoxSpace,
                Container(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    child: Text("Entrar"),
                    onPressed: () async {
                      _loginFormKey.currentState.save();

                      if (_tipoLoginSelecionado == "Cliente") {
                        var cliente = await getLoginCliente(login);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ClientePage(cliente: cliente)),
                        );
                      } else if (_tipoLoginSelecionado == "Medico") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MedicoHomePage()),
                        );
                      } else if (_tipoLoginSelecionado == "Professor") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfessorMainPage()),
                        );
                      } else if (_tipoLoginSelecionado == "Secretaria") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecretariaHomePage()),
                        );
                      } else {}
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  tipoDropDownButton() {
    return Container(
      alignment: Alignment.center,
      child: DropdownButton<String>(
        items: _tipoLogin.map((String dropDownStringItem) {
          return DropdownMenuItem<String>(
            value: dropDownStringItem,
            child: Text(dropDownStringItem),
          );
        }).toList(),
        onChanged: (String tipoLogin) {
          setState(() {
            this._tipoLoginSelecionado = tipoLogin;
          });
        },
        value: _tipoLoginSelecionado,
      ),
    );
  }
}
