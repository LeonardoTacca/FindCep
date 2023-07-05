import '../../complements/either.dart';
import '../../domain/entities/cep.dart';

abstract interface class CepDatasource {
  Future<Either<Exception, Cep>> getCepInfoFromRequest(String cepNumber);
}
