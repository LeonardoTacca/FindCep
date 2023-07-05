import 'package:find_cep_app/complements/either.dart';
import 'package:find_cep_app/complements/http_methods.dart';
import 'package:find_cep_app/external/datasources/cep_datasource_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class HttpRequestMethodsMock extends Mock implements HttpRequestMethods {}

void main() {
  late final CepDataSourceImpl dataSourceImpl;
  late final HttpRequestMethodsMock httpRequestMethods;
  setUpAll(() {
    httpRequestMethods = HttpRequestMethodsMock();
    dataSourceImpl = CepDataSourceImpl(httpRequestMethods);
  });

  group('Unit tests from External cep datasource', () {
    test('Verify if return is correct when data is correct', () async {
      when(() => httpRequestMethods.get(any())).thenAnswer((_) async =>
          Either.right('{"cep": "89870-000","logradouro": "","complemento": "","bairro": "","localidade": "Pinhalzinho","uf": "SC","ibge": "4212908","gia": "","ddd": "49","siafi": "8253"}'));

      var result = await dataSourceImpl.getCepInfoFromRequest('01234567');
      expect(result.isRight, true);
    });
    test('Verify if return is correct when cep is to short or to long', () async {
      when(() => httpRequestMethods.get(any())).thenAnswer((_) async => Either.left(Exception()));

      var result = await dataSourceImpl.getCepInfoFromRequest('0123456');
      expect(result.isLeft, true);
      var result2 = await dataSourceImpl.getCepInfoFromRequest('012345678');
      expect(result2.isLeft, true);
    });
  });
}
