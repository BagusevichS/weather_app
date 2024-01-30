import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/domain/entity/current.dart';
import 'package:weather_app/domain/entity/forecast.dart';
import 'package:weather_app/domain/entity/location.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather{
  final Location location;
  final Current current;
  final Forecast forecast;


  Weather({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

}

