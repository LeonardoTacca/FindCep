import '../../domain/entities/cep.dart';

abstract interface class CepDatasource {
  Future<Cep> getCepInfoFromRequest(String cepNumber);
}
