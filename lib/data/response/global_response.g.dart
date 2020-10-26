// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalResponse _$GlobalResponseFromJson(Map<String, dynamic> json) {
  return GlobalResponse(
    NewConfirmed: json['NewConfirmed'] as int,
    TotalConfirmed: json['TotalConfirmed'] as int,
    NewDeaths: json['NewDeaths'] as int,
    TotalDeaths: json['TotalDeaths'] as int,
    NewRecovered: json['NewRecovered'] as int,
    TotalRecovered: json['TotalRecovered'] as int,
  );
}

Map<String, dynamic> _$GlobalResponseToJson(GlobalResponse instance) =>
    <String, dynamic>{
      'NewConfirmed': instance.NewConfirmed,
      'TotalConfirmed': instance.TotalConfirmed,
      'NewDeaths': instance.NewDeaths,
      'TotalDeaths': instance.TotalDeaths,
      'NewRecovered': instance.NewRecovered,
      'TotalRecovered': instance.TotalRecovered,
    };
