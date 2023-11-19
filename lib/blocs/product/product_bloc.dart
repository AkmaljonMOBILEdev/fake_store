import 'dart:async';
import 'package:fake_store/data/models/data.dart';
import 'package:fake_store/data/network/api_service.dart';
import 'package:fake_store/services/service_locator/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<FetchAllProducts>(_onFetchAllProducts);
    on<GetProductByID>(_onGetProductById);
  }

  Future<void> _onFetchAllProducts(FetchAllProducts event,Emitter<ProductState> emit)async{
    emit(ProductLoading());
    try{
      if(event.category=="All") {
        final data = await getIt.get<ApiService>().getAllProducts();
        emit(ProductLoaded(data: data));
      }else{
        final data = await getIt.get<ApiService>().getProductsByCategory(event.category);
        emit(ProductLoaded(data: data));
      }
    }catch(e){
      emit(ProductError(error: e.toString()));
    }

  }

  Future<void> _onGetProductById(GetProductByID event, Emitter<ProductState> emit)async{
    emit(ProductLoading());
    try{
      final data = await getIt.get<ApiService>().getProductById(event.id);
      emit(ProductSingleLoaded(data: data));
    }catch(e){
      emit(ProductError(error: e.toString()));
    }
  }
}
