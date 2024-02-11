
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:mobile/screens/nav_pages/catalog/bloc/producers_tab_bloc/tab_event.dart';
import 'package:mobile/screens/nav_pages/catalog/bloc/producers_tab_bloc/tab_state.dart';
import 'package:mobile/services/producer_service.dart';
import 'package:mobile/shared/repositories/geolocation/geolocation_repository.dart';

class ProducersTabBloc extends Bloc<ProducersTabEvent, ProducersTabState>{

  final ProducerService _producerService;
  final LocationData? _locationData;


  ProducersTabBloc(this._producerService, this._locationData) : super(ProducersTabLoadingState()) {
    on<LoadProducersTabEvent>((event, emit) async {
      try {
        if(_locationData == null) return;
        final producers = await _producerService.getProducers(
            _locationData!.latitude!,
            _locationData!.longitude!,
            1
        );
        emit(ProducersTabLoadedState(producers));
      }catch(e){
        emit(ProducersTabLoadErrorState());
      }
    });
  }
}