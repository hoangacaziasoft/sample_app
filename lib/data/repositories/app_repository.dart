import 'package:acaziasampleapp/core/network_info.dart';
import 'package:acaziasampleapp/data/data_source/local/local_datasource.dart';
import 'package:acaziasampleapp/data/data_source/remote/remote_datasource.dart';
import 'package:acaziasampleapp/data/mapper/remote_mappers.dart';
import 'package:acaziasampleapp/domain/error/local_exceptions.dart';
import 'package:acaziasampleapp/domain/models/country.dart';
import 'package:acaziasampleapp/domain/models/summary.dart';
import 'package:acaziasampleapp/domain/repositories/app_repository.dart';
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
  Future<Country> getCountry(String idCountry) async {
    try {
      if (await networkInfo.hasConnect()) {
        final response = await remoteDataSource.getCountryData(idCountry);
        await localDataSource.saveCountryData(response);
        return countryMapper.mapTo(response);
      } else {

      }
    } on GenericException catch (_) {}
  }

  @override
  Future<Summary> getSummary() async {
    try {
      if (await networkInfo.hasConnect()) {
      } else {}
    } on GenericException catch (_) {}
  }
}
