import 'package:find_cep_app/data/datasources/cep_datasource.dart';
import 'package:find_cep_app/domain/entities/cep.dart';
import 'package:find_cep_app/domain/repositories/cep_repository.dart';

class CepRepositoryImpl implements CepRepository {
  final CepDatasource cepDatasource;

  CepRepositoryImpl(this.cepDatasource);
  @override
  Future<Cep> getCepInfo(String cepNumber) async {
    try {
      return await cepDatasource.getCepInfoFromRequest(cepNumber);
    } catch (e) {
      throw (Exception('Ocorreu um erro ao buscar as informações do cep no CepDatasource'));
    }
  }
}
