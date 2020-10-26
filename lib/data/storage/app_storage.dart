import 'dart:convert';
import 'package:acaziasampleapp/data/data_source/local/local_datasource.dart';
import 'package:acaziasampleapp/data/response/country_response.dart';
import 'package:acaziasampleapp/data/response/summary_response.dart';
import 'package:acaziasampleapp/data/storage/storage.dart';
import 'package:acaziasampleapp/domain/error/local_exceptions.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: Storage)
class AppStorage implements Storage {
  final SharedPreferences _preferences;

  AppStorage(this._preferences);

  final String _summaryKey = 'key_summary';
  final String _countryKey = 'key_vietnam';

  @override
  Future<SummaryResponse> getSummary() async {
    final summary = _preferences.getString(_summaryKey);
    return summary != null && summary.isNotEmpty
        ? SummaryResponse.fromJson(jsonDecode(summary))
        : throw LocalExceptions();
  }

  @override
  Future<CountryResponse> getCountryData() async {
    final country = _preferences.getString(_countryKey);
    return country != null && country.isNotEmpty
        ? CountryResponse.fromJson(jsonDecode(country))
        : null;
  }

  @override
  Future<void> saveSummary(SummaryResponse data) async {
    await _preferences.setString(_summaryKey, data.toJson().toString());
  }

  @override
  Future<void> saveCountryData(CountryResponse data) async {
    await _preferences.setString(_countryKey, data.toJson().toString());
  }
}
