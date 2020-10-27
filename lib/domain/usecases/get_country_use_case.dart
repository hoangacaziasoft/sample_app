import 'package:acaziasampleapp/domain/error/failures/failures.dart';
import 'package:acaziasampleapp/domain/models/country.dart';
import 'package:acaziasampleapp/domain/repositories/app_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

mixin GetCountryUseCase {
  Future<Either<Failure, Country>> call(String id);
}

@Injectable(as: GetCountryUseCase)
class GetCountry implements GetCountryUseCase {
  final Repository repository;

  GetCountry(this.repository);

  @override
  Future<Either<Failure, Country>> call(String id) async =>
      await repository.getCountry(id);
}
