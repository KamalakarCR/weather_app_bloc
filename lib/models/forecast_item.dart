import 'package:json_annotation/json_annotation.dart';

import './main_item.dart';
import './weather_item.dart';
import './wind.dart';

part 'forecast_item.g.dart';

@JsonSerializable(explicitToJson: true)
class ForecastItem {
  Main main;
  List<WeatherItem> weather;
  Wind wind;
  @JsonKey(name: 'dt_txt')
  String date;

  ForecastItem({
    required this.main,
    required this.weather,
    required this.wind,
    required this.date,
  });

  factory ForecastItem.fromJson(Map<String, dynamic> json) =>
      _$ForecastItemFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastItemToJson(this);
}
