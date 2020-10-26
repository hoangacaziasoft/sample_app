import 'package:acaziasampleapp/domain/models/country.dart';
import 'package:acaziasampleapp/domain/models/summary.dart';

abstract class Repository{
  Future<Summary> getSummary();
  Future<Country> getCountry(String idCountry);
}