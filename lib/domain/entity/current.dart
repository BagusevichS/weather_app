import 'package:json_annotation/json_annotation.dart';
part 'current.g.dart';
@JsonSerializable()
class Current {
  final double temp_c;
  final double wind_kph;
  final double humidity;
  final Condition condition;

  Current({
    required this.condition,
    required this.temp_c,
    required this.wind_kph,
    required this.humidity,
  });

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);

}

@JsonSerializable()
class Condition {
  final String text;
  final String icon;

  Condition({required this.text,required this.icon});

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}