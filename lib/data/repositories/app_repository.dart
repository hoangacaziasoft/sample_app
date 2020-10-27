import 'package:acaziasampleapp/core/network_info.dart';
import 'package:acaziasampleapp/data/data_source/local/local_datasource.dart';
import 'package:acaziasampleapp/data/data_source/remote/remote_datasource.dart';
import 'package:acaziasampleapp/data/mapper/remote_mappers.dart';
import 'package:acaziasampleapp/domain/error/exceptions/local_exceptions.dart';
import 'package:acaziasampleapp/domain/error/failures/failures.dart';
import 'package:acaziasampleapp/domain/models/country.dart';
import 'package:acaziasampleapp/domain/models/summary.dart';
import 'package:acaziasampleapp/domain/repositories/app_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: Repository)
class AppRepository implements Repository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final CountryResponseMapper countryMapper;
  final SummaryResponseMapper summaryMapper;
  final NetworkInfo networkInfo;

  AppRepository(this.networkInfo, this.remoteDataSource, this.localDataSource,
      this.countryMapper, this.summaryMapper);

  @override
  Future<Either<Failure, Country>> getCountry(String idCountry) async {
    var response;

    try {
      if (await networkInfo.hasConnect()) {
        response = await remoteDataSource.getCountryData(idCountry);
        await localDataSource.saveCountryData(response);
      } else {
        response = await localDataSource.getCountryData();
      }
      return Right(countryMapper.mapTo(response));
    } on GenericException {
      return Left(GenericFailure());
    } on LocalEmptyException {
      return Left(LocalEmptyFailure());
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Either<Failure, Summary>> getSummary() async {
    var response;

    try {
      if (await networkInfo.hasConnect()) {
        response = await remoteDataSource.getSummaryData();
        await localDataSource.saveSummary(response);
      } else {
        response = await localDataSource.getSummary();
      }
      return Right(summaryMapper.mapTo(response));
    } on GenericException {
      return Left(GenericFailure());
    } on LocalEmptyException {
      return Left(LocalEmptyFailure());
    } catch (e) {
      throw e;
    }
  }
}
