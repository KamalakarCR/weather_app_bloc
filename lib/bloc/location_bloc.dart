import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_bloc/repositories/location_repository.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final _locationRepository = LocationRepository();

  LocationBloc() : super(LocationInitial()) {
    on<LocationEvent>((event, emit) async {
      emit(LocationLoading());
      try {
        final res = await _locationRepository.determinePosition();
        emit(LocationSuccess(position: res));
      } catch (e) {
        emit(LocationError(error: e.toString()));
      }
    });
  }
}
