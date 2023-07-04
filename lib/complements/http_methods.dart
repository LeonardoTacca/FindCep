import 'package:http/http.dart' as http;

class HttpRequestMethods {
  final http.Client httpClient;

  HttpRequestMethods(this.httpClient);

  Future<String> get(String url) async {
    try {
      http.Response response = await httpClient.get(Uri.parse(url), headers: {"Content-type": "application/json"});
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Error Ocurrs');
      }
    } catch (e) {
      throw Exception('Ocorreu um erro');
    }
  }
}
