import 'package:acaziasampleapp/domain/error/failures/failures.dart';
import 'package:acaziasampleapp/domain/models/summary.dart';
import 'package:acaziasampleapp/domain/repositories/app_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

mixin GetSummaryUseCase {
  Future<Either<Failure, Summary>> call();
}

@Injectable(as: GetSummaryUseCase)
class GetSummary implements GetSummaryUseCase {
  final Repository repository;

  GetSummary(this.repository);

  @override
  Future<Either<Failure, Summary>> call() async =>
      await repository.getSummary();
}
