import 'package:acaziasampleapp/data/response/country_response.dart';
import 'package:acaziasampleapp/data/response/summary_response.dart';
import 'package:acaziasampleapp/data/storage/storage.dart';
abstract class LocalDataSource {
  Future<void> saveSummary(SummaryResponse data);
  Future<SummaryResponse> getSummary();

  Future<void> saveCountryData(CountryResponse data);
  Future<CountryResponse> getCountryData();
}

class AppLocalDataSource implements LocalDataSource {
  final Storage _storage;

  AppLocalDataSource(this._storage);

  @override
  Future<CountryResponse> getCountryData() async {
    await _storage.getCountryData();
  }

  @override
  Future<SummaryResponse> getSummary() async => await _storage.getSummary();

  @override
  Future<void> saveCountryData(CountryResponse data) =>
      _storage.saveCountryData(data);

  @override
  Future<void> saveSummary(SummaryResponse data) => _storage.saveSummary(data);
}
