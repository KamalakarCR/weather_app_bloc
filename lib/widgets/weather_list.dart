import 'package:flutter/material.dart';

import './weather_item.dart';
import '../models/weather_model.dart';

class WeatherList extends StatelessWidget {
  final WeatherModel weatherModel;

  const WeatherList({Key? key, required this.weatherModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var keysList = weatherModel.weatherData.keys.toList();
    var valuesList = weatherModel.weatherData.values.toList();

    return ListView.builder(
      itemCount: keysList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: WeatherItem(
            dateStr: keysList[index],
            list: valuesList[index],
          ),
        );
      },
    );
  }
}
