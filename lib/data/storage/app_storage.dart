import 'dart:convert';
import 'package:acaziasampleapp/data/response/country_response.dart';
import 'package:acaziasampleapp/data/response/summary_response.dart';
import 'package:acaziasampleapp/data/storage/storage.dart';
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
    print(summary);
    return summary != null && summary.isNotEmpty
        ? SummaryResponse.fromJson(jsonDecode(summary))
        : null;
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
    await _preferences.setString(_summaryKey, jsonEncode(data.toJson()));
  }

  @override
  Future<void> saveCountryData(CountryResponse data) async {
    await _preferences.setString(_countryKey, jsonEncode(data.toJson()));
  }
}
