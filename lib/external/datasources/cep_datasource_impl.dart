// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:find_cep_app/data/models/cep_model.dart';
import 'package:find_cep_app/domain/entities/cep.dart';

import '../../complements/enviroment_configs.dart';
import '../../complements/http_methods.dart';
import '../../data/datasources/cep_datasource.dart';

class CepDataSourceImpl implements CepDatasource {
  @override
  Future<Cep> getCepInfoFromRequest(String cepNumber) async {
    try {
      var result = await HttpRequestMethods.get(Enviroment.urlBase + cepNumber);
      CepModel cepInfos = CepModel.fromJson(result);
      return cepInfos;
    } catch (e) {
      throw (Exception('Ocorreu um erro ao mapear o modelo do cep'));
    }
  }
}
