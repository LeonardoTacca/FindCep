import 'package:find_cep_app/domain/entities/cep.dart';

abstract interface class CepRepository {
  Future<Cep> getCepInfo(String cepNumber);
}
