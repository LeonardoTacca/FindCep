import 'package:find_cep_app/complements/either.dart';
import 'package:find_cep_app/data/repositories/cep_repository_impl.dart';
import 'package:find_cep_app/domain/entities/cep.dart';
import 'package:find_cep_app/domain/use_cases/get_cep_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CepRepositoryImplMock extends Mock implements CepRepositoryImpl {}

class CepMock extends Mock implements Cep {}

void main() {
  late final GetCepInfoImpl getCepInfoImpl;
  late final CepRepositoryImplMock cepRepositoryImpl;
  setUpAll(() {
    cepRepositoryImpl = CepRepositoryImplMock();
    getCepInfoImpl = GetCepInfoImpl(cepRepositoryImpl);
  });

  group('Use case get cep Info tests', () {
    test('Verify if useCase is working correctly', () async {
      when(() => cepRepositoryImpl.getCepInfo(any())).thenAnswer((invocation) => Future.value(Right(CepMock())));
      var result = await getCepInfoImpl('55555555');
      result.fold((left) {
        expect(left, isNull);
      }, (right) {
        expect(right, isA<Cep>());
      });
    });
    test('Verify if useCase is working correctly when receive a empty value on function parameter', () async {
      var resultForceError = await getCepInfoImpl('');
      resultForceError.fold((left) {
        expect(left, isException);
      }, (right) {
        expect(right, isNull);
      });
    });
    test('Verify if useCase is working correctly when receive a short value on function parameter', () async {
      var resultForceError = await getCepInfoImpl('555555');
      resultForceError.fold((left) {
        expect(left, isException);
      }, (right) {
        expect(right, isNull);
      });
    });
    test('Verify if useCase is working correctly when the function parameter is correctly, but api response is wrong', () async {
      when(() => cepRepositoryImpl.getCepInfo(any())).thenAnswer((invocation) => Future.value(Left(Exception('Não foi encontrado'))));
      var result = await getCepInfoImpl('12345678');
      result.fold((left) {
        expect(left, isException);
      }, (right) {
        expect(right, isNull);
      });
    });
  });
}
