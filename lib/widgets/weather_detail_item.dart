import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utilities/temperature.dart';
import '../models/forecast_item.dart';

class WeatherDetailItem extends StatelessWidget {
  final ForecastItem weatherItem;

  const WeatherDetailItem({Key? key, required this.weatherItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final time = DateFormat.jm().format(DateTime.parse(weatherItem.date));

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 6),
      child: Card(
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                time,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  Image.network(
                    "https://openweathermap.org/img/wn/${weatherItem.weather[0].icon}@2x.png",
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    Temperature.kelvin(weatherItem.main.tempMax)
                            .celsius
                            .toStringAsFixed(1) +
                        "\u00B0" +
                        "C",
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    Temperature.kelvin(weatherItem.main.tempMin)
                            .celsius
                            .toStringAsFixed(1) +
                        "\u00B0" +
                        "C",
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.water_drop_outlined),
                  Text('${weatherItem.main.humidity}%'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
