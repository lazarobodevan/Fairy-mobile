part of 'producer_details_bloc.dart';

abstract class ProducerDetailsEvent extends Equatable {
  const ProducerDetailsEvent();
}

class LoadProducerDetailsEvent extends ProducerDetailsEvent{
  final String producerId;

  LoadProducerDetailsEvent({required this.producerId});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}