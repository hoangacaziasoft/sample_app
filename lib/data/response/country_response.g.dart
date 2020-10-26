// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryResponse _$CountryResponseFromJson(Map<String, dynamic> json) {
  return CountryResponse(
    Country: json['Country'] as String,
    CountryCode: json['CountryCode'] as String,
    Slug: json['Slug'] as String,
    Date: json['Date'] as String,
    NewConfirmed: json['NewConfirmed'] as int,
    TotalRecovered: json['TotalRecovered'] as int,
    NewDeaths: json['NewDeaths'] as int,
    TotalDeaths: json['TotalDeaths'] as int,
    NewRecovered: json['NewRecovered'] as int,
    TotalConfirmed: json['TotalConfirmed'] as int,
  );
}

Map<String, dynamic> _$CountryResponseToJson(CountryResponse instance) =>
    <String, dynamic>{
      'Country': instance.Country,
      'CountryCode': instance.CountryCode,
      'Slug': instance.Slug,
      'Date': instance.Date,
      'NewConfirmed': instance.NewConfirmed,
      'TotalConfirmed': instance.TotalConfirmed,
      'NewDeaths': instance.NewDeaths,
      'TotalDeaths': instance.TotalDeaths,
      'NewRecovered': instance.NewRecovered,
      'TotalRecovered': instance.TotalRecovered,
    };
