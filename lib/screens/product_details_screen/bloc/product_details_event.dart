part of 'product_details_bloc.dart';

@immutable
abstract class ProductDetailsEvent extends Equatable{}


class LoadProductDetailsEvent extends ProductDetailsEvent{
  final String productId;

  LoadProductDetailsEvent({required this.productId});
  @override
  // TODO: implement props
  List<Object?> get props => [];

}