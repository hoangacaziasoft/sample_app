import 'package:acaziasampleapp/data/response/country_response.dart';
import 'package:acaziasampleapp/data/response/summary_response.dart';

abstract class Storage {
  Future<void> saveSummary(SummaryResponse data);
  Future<SummaryResponse> getSummary();

  Future<void> saveCountryData(CountryResponse data);
  Future<CountryResponse> getCountryData();
}