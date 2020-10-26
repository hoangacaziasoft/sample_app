import 'package:acaziasampleapp/domain/models/country.dart';
import 'package:acaziasampleapp/domain/models/global.dart';

class Summary{
  final Global global;
  final List<Country> countries;

  Summary({this.global, this.countries});
}