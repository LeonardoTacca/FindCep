import 'package:find_cep_app/complements/either.dart';
import 'package:http/http.dart' as http;

class HttpRequestMethods {
  Future<Either<Exception, String>> get(String url) async {
    if (url.isEmpty) {
      return Left(Exception('URL vazia'));
    }
    http.Response response = await http.get(Uri.parse(url), headers: {"Content-type": "application/json"});
    switch (response.statusCode) {
      case 200:
        return Right(response.body);
      default:
        return Left(Exception('Ocorreu um erro ao realizar a requisição'));
    }
  }
}
