// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:find_cep_app/complements/either.dart';
import 'package:find_cep_app/domain/entities/cep.dart';
import 'package:find_cep_app/domain/repositories/cep_repository.dart';

abstract interface class GetCepInfo {
  Future<Either<Exception, Cep>> call(String cepNumber);
}

class GetCepInfoImpl implements GetCepInfo {
  final CepRepository repository;

  GetCepInfoImpl(
    this.repository,
  );
  @override
  Future<Either<Exception, Cep>> call(String cepNumber) async {
    if (cepNumber.isEmpty) {
      return Left(Exception('O numero do cep não pode estar vazio'));
    }
    if (cepNumber.length < 8 || cepNumber.length > 8) {
      return Left(Exception('O Cep pode conter apenas 8 numeros'));
    }
    return await repository.getCepInfo(cepNumber);
  }
}
