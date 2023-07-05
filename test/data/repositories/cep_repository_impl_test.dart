import 'package:find_cep_app/complements/either.dart';
import 'package:find_cep_app/data/repositories/cep_repository_impl.dart';
import 'package:find_cep_app/domain/entities/cep.dart';
import 'package:find_cep_app/external/datasources/cep_datasource_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CepDataSourceImplMock extends Mock implements CepDataSourceImpl {}

class CepMock extends Mock implements Cep {}

void main() {
  late CepDataSourceImplMock cepDataSourceImplMock;
  late CepRepositoryImpl cepRepositoryImpl;
  late CepMock cepMock;
  setUpAll(() {
    cepMock = CepMock();
    cepDataSourceImplMock = CepDataSourceImplMock();
    cepRepositoryImpl = CepRepositoryImpl(cepDataSourceImplMock);
  });

  test('verify if repository calls the correct function to return info from cep', () async {
    when(() => cepDataSourceImplMock.getCepInfoFromRequest('55555555')).thenAnswer((_) async => Right(cepMock));
    await cepRepositoryImpl.getCepInfo('55555555').then((value) => verify(() => cepDataSourceImplMock.getCepInfoFromRequest('555555555')).called(1));
  });
  
}
