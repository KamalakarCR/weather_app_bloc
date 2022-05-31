import './forecast_item.dart';

import './city.dart';

class WeatherModel {
  City city;
  Map<String, List<ForecastItem>> weatherData;

  WeatherModel({required this.city, required this.weatherData});
}
