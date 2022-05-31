import 'package:dio/dio.dart';

import 'base_service.dart';

class WeatherService {
  BaseService service = BaseService();
  static const String apiKey = "4e514a535314998042ac72a1b8493683";

  Future<Response> getWeather(dynamic zipcode) async {
    try {
      Response response = await service.request(
        "https://api.openweathermap.org/data/2.5/forecast?zip=$zipcode,in&appid=$apiKey",
        method: "Get",
      );
      return response;
    } on DioError catch (e) {
      throw handleError(e);
    }
  }
}
