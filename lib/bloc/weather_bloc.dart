import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app_bloc/models/weather_model.dart';
import 'package:weather_app_bloc/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final _weatherRepository = WeatherRepository();

  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      if (event is WeatherRequest) {
        emit(WeatherLoadInprogress());
        try {
          final res = await _weatherRepository.getWeatherData(event.zipCode);
          emit(WeatherLoadSuccess(weather: res));
        } catch (e) {
          emit(
            WeatherLoadFailure(error: e.toString()),
          );
        }
      }
    });
  }
}
