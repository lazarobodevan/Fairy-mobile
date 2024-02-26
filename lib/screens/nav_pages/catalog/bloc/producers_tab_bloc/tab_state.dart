import 'package:equatable/equatable.dart';
import 'package:mobile/models/producer/producer_request_model.dart';


abstract class ProducersTabState extends Equatable{
  const ProducersTabState();
}

class ProducersTabLoadingState extends ProducersTabState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProducersTabLoadedState extends ProducersTabState{
  final ProducerRequestModel producers;

  ProducersTabLoadedState(this.producers);
  @override
  // TODO: implement props
  List<Object?> get props => [producers];

}

class ProducersTabLoadErrorState extends ProducersTabState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}