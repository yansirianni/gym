import 'package:http/http.dart' as http;
import 'package:gym/model/fichaMedicaModel.dart';

Future<FichaMedica> getFichaMedica(String cpf) async {
  var queryParameters = {'cpf': cpf};

  var uri = Uri.http(
      'localhost', '/Academia/api/academia/exame-medico', queryParameters);

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return fichaMedicaFromJson(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return null;
  }
}

Future<http.Response> createFichaMedica(FichaMedica fichaMedica) async {
  final String apiUrl = 'http://localhost/Academia/api/academia/exame-medico';

  final response = await http.post(apiUrl,
      headers: {
        'Content-Type': 'application/json',
      },
      body: fichaMedicaToJson(fichaMedica));

  if (response.statusCode == 200) {
    print('Success = ' + response.toString());
  } else {
    print('Error = ' + response.reasonPhrase + response.toString());
  }

  return response;
}
