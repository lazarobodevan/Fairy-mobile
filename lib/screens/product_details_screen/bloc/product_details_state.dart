part of 'product_details_bloc.dart';


abstract class ProductDetailsState extends Equatable{
  const ProductDetailsState();
}

class ProductDetailsLoadingState extends ProductDetailsState {
  @override
  List<Object?> get props => [];
}

class ProductDetailsLoadedState extends ProductDetailsState{
  final ProductModel productModel;

  const ProductDetailsLoadedState({required this.productModel});

  @override
  List<Object?> get props => [productModel];
}

class ProductDetailsErrorState extends ProductDetailsState{
  @override
  List<Object?> get props => [];
}
