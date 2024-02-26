part of 'producer_details_bloc.dart';

abstract class ProducerDetailsState extends Equatable {
  const ProducerDetailsState();
}

class ProducerDetailsLoadingState extends ProducerDetailsState {
  @override
  List<Object> get props => [];
}


class ProducerDetailsLoadedState extends ProducerDetailsState {
  final ProducerProductsRequest producerProductsRequest;

  ProducerDetailsLoadedState({required this.producerProductsRequest});
  @override
  List<Object> get props => [];
}

class ProducerDetailsErrorState extends ProducerDetailsState {
  @override
  List<Object> get props => [];
}