import 'package:find_cep_app/data/datasources/cep_datasource.dart';
import 'package:find_cep_app/domain/entities/cep.dart';
import 'package:find_cep_app/domain/repositories/cep_repository.dart';

import '../../complements/either.dart';

class CepRepositoryImpl implements CepRepository {
  final CepDatasource cepDatasource;

  CepRepositoryImpl(this.cepDatasource);
  @override
  Future<Either<Exception, Cep>> getCepInfo(String cepNumber) async {
    return await cepDatasource.getCepInfoFromRequest(cepNumber);
  }
}
