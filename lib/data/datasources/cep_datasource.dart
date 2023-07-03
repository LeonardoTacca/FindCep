import '../../domain/entities/cep.dart';

abstract interface class CepRepository {
  Future<Cep> getCepInfoFromRequest(String cepNumber);
}
