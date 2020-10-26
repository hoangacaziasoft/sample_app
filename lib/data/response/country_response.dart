import 'package:json_annotation/json_annotation.dart';

part 'country_response.g.dart';

@JsonSerializable()
class CountryResponse {
  String Country, CountryCode, Slug, Date;
  int NewConfirmed,
      TotalConfirmed,
      NewDeaths,
      TotalDeaths,
      NewRecovered,
      TotalRecovered;

  CountryResponse(
      {this.Country,
      this.CountryCode,
      this.Slug,
      this.Date,
      this.NewConfirmed,
      this.TotalRecovered,
      this.NewDeaths,
      this.TotalDeaths,
      this.NewRecovered,
      this.TotalConfirmed});

  factory CountryResponse.fromJson(Map<String, dynamic> json) =>
      _$CountryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CountryResponseToJson(this);
}
