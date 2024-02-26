import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mobile/models/product/product_model.dart';
import 'package:mobile/services/product_service.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final ProductService productService;
  final String productId;

  ProductDetailsBloc(this.productService, this.productId) : super(ProductDetailsLoadingState()) {
    on<ProductDetailsEvent>((event, emit) async {
      try{
        var productDetails = await productService.getProductById(productId);
        emit(ProductDetailsLoadedState(productModel: productDetails));
      }catch(e){
        print(e);
        emit(ProductDetailsErrorState());
      }
    });
  }
}
