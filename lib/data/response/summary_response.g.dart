// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SummaryResponse _$SummaryResponseFromJson(Map<String, dynamic> json) {
  return SummaryResponse(
    Global: json['Global'] == null
        ? null
        : GlobalResponse.fromJson(json['Global'] as Map<String, dynamic>),
    Countries: (json['Countries'] as List)
        ?.map((e) => e == null
            ? null
            : CountryResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SummaryResponseToJson(SummaryResponse instance) =>
    <String, dynamic>{
      'Global': instance.Global.toJson(),
      'Countries': instance.Countries.map((e) => e.toJson()).toList(),
    };
