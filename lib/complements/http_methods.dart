import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpRequestMethods {
  static Future<dynamic> get(String url) async {
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {"Content-type": "application/json"});
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      Exception('Ocorreu um erro');
    }
  }
}
