part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationSuccess extends LocationState {
  final Position position;
  LocationSuccess({required this.position});
}

class LocationError extends LocationState {
  final String error;

  LocationError({required this.error});
}
