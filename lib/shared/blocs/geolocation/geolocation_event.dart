part of 'geolocation_bloc.dart';

abstract class GeolocationEvent extends Equatable {
  const GeolocationEvent();

  @override
  List<Object> get props => [];
}

class LoadGeolocationEvent extends GeolocationEvent{}

class UpdateGeolocationEvent extends GeolocationEvent{
  final LocationData position;

  const UpdateGeolocationEvent(this.position);

  @override
  List<Object> get props => [position];
}
