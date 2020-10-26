import 'package:json_annotation/json_annotation.dart';

part 'global_response.g.dart';

@JsonSerializable()
class GlobalResponse {
  int NewConfirmed,
      TotalConfirmed,
      NewDeaths,
      TotalDeaths,
      NewRecovered,
      TotalRecovered;

  GlobalResponse(
      {this.NewConfirmed,
      this.TotalConfirmed,
      this.NewDeaths,
      this.TotalDeaths,
      this.NewRecovered,
      this.TotalRecovered});

  factory GlobalResponse.fromJson(Map<String, dynamic> json) => _$GlobalResponseFromJson(json);

  Map<String, dynamic> toJson()=> _$GlobalResponseToJson(this);
}
