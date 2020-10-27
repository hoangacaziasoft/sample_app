import 'package:acaziasampleapp/domain/error/failures/failures.dart';
import 'package:acaziasampleapp/domain/models/country.dart';
import 'package:acaziasampleapp/domain/models/summary.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, Summary>> getSummary();

  Future<Either<Failure, Country>> getCountry(String idCountry);
}
