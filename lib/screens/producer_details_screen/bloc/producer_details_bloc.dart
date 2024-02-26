import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile/models/producer/producer_products_request_model.dart';
import 'package:mobile/services/producer_service.dart';

part 'producer_details_event.dart';
part 'producer_details_state.dart';

class ProducerDetailsBloc extends Bloc<ProducerDetailsEvent, ProducerDetailsState> {
  final ProducerService producerService;

  ProducerDetailsBloc({required this.producerService}) : super(ProducerDetailsLoadingState()) {
    on<LoadProducerDetailsEvent>((event, emit) async{
      try{
        var producerProductsRequest = await producerService.getProducerDetails(event.producerId);

        emit(ProducerDetailsLoadedState(producerProductsRequest: producerProductsRequest));
      }catch(e){
        emit(ProducerDetailsErrorState());
      }
    });
  }
}
