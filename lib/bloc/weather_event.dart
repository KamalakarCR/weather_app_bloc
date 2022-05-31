part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class WeatherRequest extends WeatherEvent {
  final String zipCode;

  WeatherRequest({required this.zipCode});
}