import 'package:find_cep_app/complements/http_methods.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpRequestMethods extends Mock implements HttpRequestMethods {}

void main() {
  final mockHttpRequestMethods = MockHttpRequestMethods();
  group('HttpResquestMethods test group', () {
    test('test to verify if http get method is working correctly when return is good from api', () async {
      when(() => mockHttpRequestMethods.get(any())).thenAnswer(
        (invocation) async {
          return Future.value(
              {"cep": "89870-000", "logradouro": "", "complemento": "", "bairro": "", "localidade": "Pinhalzinho", "uf": "SC", "ibge": "4212908", "gia": "", "ddd": "49", "siafi": "8253"}.toString());
        },
      );
      var result = await mockHttpRequestMethods.get('');
      expect(result, isA<String>());
    });
  });
}
