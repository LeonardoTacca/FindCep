import 'package:find_cep_app/domain/entities/cep.dart';

import '../../complements/either.dart';

abstract interface class CepRepository {
  Future<Either<Exception, Cep>> getCepInfo(String cepNumber);
}
