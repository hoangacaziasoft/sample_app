import 'dart:convert';

import 'package:acaziasampleapp/data/services/remote_service.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@Named('mock')
@Injectable(as: RemoteService)
class AppMockRemoteService implements RemoteService {
  final pathOfSummary = 'assets/json/summary.json';
  final pathOfCountry = 'assets/json/country.json';

  @override
  Future getCountryData(String countryId) => _parseFileToJson(pathOfCountry);

  @override
  Future getSummaryData() => _parseFileToJson(pathOfSummary);

  dynamic _parseFileToJson(String path) async {
    final string = await rootBundle.loadString(path);
    return jsonDecode(string);
  }
}
