import 'package:acaziasampleapp/data/response/country_response.dart';
import 'package:acaziasampleapp/data/response/summary_response.dart';
import 'package:acaziasampleapp/data/storage/storage.dart';
import 'package:acaziasampleapp/domain/error/exceptions/local_exceptions.dart';
import 'package:injectable/injectable.dart';

abstract class LocalDataSource {
  Future<void> saveSummary(SummaryResponse data);

  Future<SummaryResponse> getSummary();

  Future<void> saveCountryData(CountryResponse data);

  Future<CountryResponse> getCountryData();
}

@Injectable(as: LocalDataSource)
class AppLocalDataSource implements LocalDataSource {
  final Storage _storage;

  AppLocalDataSource(this._storage);

  @override
  Future<CountryResponse> getCountryData() async {
    final data = await _storage.getCountryData();
    if (data != null) return data;
    throw LocalEmptyException();
  }

  @override
  Future<SummaryResponse> getSummary() async {
    final data = await _storage.getSummary();
    if (data != null) return data;
    throw LocalEmptyException();
  }

  @override
  Future<void> saveCountryData(CountryResponse data) =>
      _storage.saveCountryData(data);

  @override
  Future<void> saveSummary(SummaryResponse data) => _storage.saveSummary(data);
}
