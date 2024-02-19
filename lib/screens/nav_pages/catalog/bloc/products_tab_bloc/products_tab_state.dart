part of 'products_tab_bloc.dart';

abstract class ProductsTabState extends Equatable {
  const ProductsTabState();
}

class ProductsTabLoadingState extends ProductsTabState {
  @override
  List<Object> get props => [];
}

class ProductsTabLoadedState extends ProductsTabState{
  final ProductRequestModel products;

  ProductsTabLoadedState({required this.products});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductsTabErrorState extends ProductsTabState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
