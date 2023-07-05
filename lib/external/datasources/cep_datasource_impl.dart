import 'package:find_cep_app/data/models/cep_model.dart';
import 'package:find_cep_app/domain/entities/cep.dart';

import '../../complements/either.dart';
import '../../complements/enviroment_configs.dart';
import '../../complements/http_methods.dart';
import '../../data/datasources/cep_datasource.dart';

class CepDataSourceImpl implements CepDatasource {
  final HttpRequestMethods httpRequestMethods;

  CepDataSourceImpl(this.httpRequestMethods);
  @override
  Future<Either<Exception, Cep>> getCepInfoFromRequest(String cepNumber) async {
    var result = await httpRequestMethods.get('${Enviroment.urlBase}$cepNumber/json/');
    return result.fold((left) {
      return Left(left);
    }, (right) {
      Cep cep = CepModel.fromJson(right);
      return Right(cep);
    });
  }
}
