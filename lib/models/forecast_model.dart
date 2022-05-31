import 'package:json_annotation/json_annotation.dart';

import './forecast_item.dart';
import './city.dart';

part 'forecast_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Forecast {
  List<ForecastItem> list;
  City city;

  Forecast({required this.list, required this.city});

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
