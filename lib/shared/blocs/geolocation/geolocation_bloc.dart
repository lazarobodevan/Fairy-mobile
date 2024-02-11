import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:location/location.dart';
import 'package:mobile/shared/repositories/geolocation/geolocation_repository.dart';

part 'geolocation_event.dart';

part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GeolocationRepository _geolocationRepository;
  late LocationData? locationData;

  GeolocationBloc({required GeolocationRepository geolocationRepository})
      : _geolocationRepository = geolocationRepository,
        locationData = null,
        super(GeolocationLoadingState()) {
    on<LoadGeolocationEvent>((event, emit) async {
      try{
        locationData = await _geolocationRepository.getCurrentLocation();
        if(locationData != null) {
          emit(GeolocationLoadedState(position: locationData!));
        }else{
          emit(GeolocationErrorState());
        }
      }catch(e){
        emit(GeolocationErrorState());
      }

    });
  }
}
