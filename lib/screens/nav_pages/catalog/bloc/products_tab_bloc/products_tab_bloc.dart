import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:location/location.dart';
import 'package:mobile/models/product_request_model.dart';
import 'package:mobile/services/product_service.dart';

part 'products_tab_event.dart';
part 'products_tab_state.dart';

class ProductsTabBloc extends Bloc<ProductsTabEvent, ProductsTabState> {

  final ProductService productService;
  final LocationData? _locationData;

  ProductsTabBloc(this.productService, this._locationData) : super(ProductsTabLoadingState()) {
    on<LoadProductsTabEvent>((event, emit) async {
      try{
        if(_locationData == null) return;

        final products = await productService.getNearbyProducts(_locationData!.latitude!, _locationData!.longitude!, 2);
        emit(ProductsTabLoadedState(products: products));

      }catch(e){
        emit(ProductsTabErrorState());
      }
    });
  }
}
