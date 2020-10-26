import 'package:acaziasampleapp/data/response/country_response.dart';
import 'package:acaziasampleapp/data/response/global_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'summary_response.g.dart';

@JsonSerializable()
class SummaryResponse {
  GlobalResponse Global;
  List<CountryResponse> Countries;

  SummaryResponse({this.Global, this.Countries});

  factory SummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$SummaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryResponseToJson(this);
}
