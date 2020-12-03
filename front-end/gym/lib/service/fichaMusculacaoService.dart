import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:gym/model/fichaMusculacaoModel.dart';

Future<List<FichaMusculacao>> getFichaMusculacao(String cpf) async {
  var queryParameters = {'cpf': cpf};

  var uri = Uri.http(
      'localhost', '/Academia/api/academia/ficha-musculacao', queryParameters);

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return listFichaMusculacaoFromJson(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return null;
  }
}

Future<http.Response> createFichaMusculacao(
    List<FichaMusculacao> fichaMusculacao) async {
  final String apiUrl =
      'http://localhost/Academia/api/academia/ficha-musculacao';

  final response = await http.post(apiUrl,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(fichaMusculacao));

  if (response.statusCode == 200) {
    print('Success = ' + response.toString());
  } else {
    print('Error = ' + response.reasonPhrase + response.toString());
  }

  return response;
}
