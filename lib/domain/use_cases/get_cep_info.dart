// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:find_cep_app/domain/entities/cep.dart';
import 'package:find_cep_app/domain/repositories/cep_repository.dart';

abstract interface class GetCepInfo {
  Future<Cep> call(String cepNumber);
}

class GetCepInfoImpl implements GetCepInfo {
  CepRepository repository;
  GetCepInfoImpl({
    required this.repository,
  });
  @override
  Future<Cep> call(String cepNumber) async {
    try {
      return await repository.getCepInfo(cepNumber);
    } catch (e) {
      throw Exception('O cep não existe');
    }
  }
}
