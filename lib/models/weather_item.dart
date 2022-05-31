import 'package:json_annotation/json_annotation.dart';

part 'weather_item.g.dart';

@JsonSerializable()
class WeatherItem {
  int id;
  String main;
  String description;
  String icon;

  WeatherItem({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherItem.fromJson(Map<String, dynamic> json) =>
      _$WeatherItemFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherItemToJson(this);
}
