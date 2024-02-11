import 'package:equatable/equatable.dart';
import 'package:location/location.dart';

abstract class ProducersTabEvent extends Equatable{
  const ProducersTabEvent();
}

class LoadProducersTabEvent extends ProducersTabEvent{

  @override
  // TODO: implement props
  List<Object?> get props => [];

}