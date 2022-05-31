import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:weather_app_bloc/models/forecast_item.dart';
import 'package:weather_app_bloc/models/forecast_model.dart';
import 'package:weather_app_bloc/models/weather_model.dart';
import 'package:weather_app_bloc/services/weather_service.dart';

class WeatherRepository {
  final weatherService = WeatherService();

  Future<WeatherModel> getWeatherData(String zipcode) async {
    dynamic res;
    try {
      res = await weatherService.getWeather(zipcode);
      res = json.decode(res.toString());
      if (res['cod'] != "200") {
        throw res['message'];
      } else {}
    } catch (e) {
      throw e.toString();
    }

    var data = groupBy(Forecast.fromJson(res).list, (ForecastItem item) {
      return item.date.split(" ")[0];
    });

    var weatherData = WeatherModel(
      city: Forecast.fromJson(res).city,
      weatherData: data,
    );

    return weatherData;
  }
}
