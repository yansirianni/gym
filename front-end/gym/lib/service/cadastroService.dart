import 'package:gym/model/LoginModel.dart';
import 'package:gym/model/cadastroClienteModel.dart';
import 'package:http/http.dart' as http;

Future<CadastroCliente> getLoginCliente(Login login) async {
  var queryParameters = {
    'login': login.usuario,
    'senha': login.senha,
  };

  var uri = Uri.http(
      'localhost', '/Academia/api/account/cliente/login', queryParameters);

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return cadastroClienteFromJson(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return null;
  }
}

Future<CadastroCliente> getCadastroCliente(String cpf) async {
  var queryParameters = {'cpf': cpf};

  var uri =
      Uri.http('localhost', '/Academia/api/account/cliente', queryParameters);

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return cadastroClienteFromJson(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return null;
  }
}

Future<http.Response> createCadastroCliente(
    CadastroCliente cadastroCliente) async {
  final String apiUrl = 'http://localhost/Academia/api/account/cliente';

  final response = await http.post(apiUrl,
      headers: {
        'Content-Type': 'application/json',
      },
      body: cadastroClienteToJson(cadastroCliente));

  if (response.statusCode == 200) {
    print('Success = ' + response.toString());
  } else {
    print('Error = ' + response.reasonPhrase + response.toString());
  }

  return response;
}
