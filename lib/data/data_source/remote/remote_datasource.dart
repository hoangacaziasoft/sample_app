import 'package:acaziasampleapp/data/response/country_response.dart';
import 'package:acaziasampleapp/data/response/summary_response.dart';
import 'package:acaziasampleapp/data/services/remote_service.dart';
import 'package:acaziasampleapp/domain/error/exceptions/local_exceptions.dart';
import 'package:injectable/injectable.dart';

mixin RemoteDataSource {
  Future<SummaryResponse> getSummaryData();

  Future<CountryResponse> getCountryData(String countryId);
}

@Injectable(as: RemoteDataSource)
class AppRemoteDataSource implements RemoteDataSource {
  final RemoteService _mockRemote;
  final RemoteService _remote;

  AppRemoteDataSource(
      @Named('mock') this._mockRemote, @Named('default') this._remote);

  @override
  Future<CountryResponse> getCountryData(String countryId) async {
    try {
      return CountryResponse.fromJson(
          await _remote.getCountryData(countryId));
    } on Exception catch (_) {
      throw GenericException();
    }
  }

  @override
  Future<SummaryResponse> getSummaryData() async {
    try {
      return SummaryResponse.fromJson(await _remote.getSummaryData());
    } on Exception catch (_) {
      throw GenericException();
    }
  }
}
