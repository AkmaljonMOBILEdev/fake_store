part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState{}
class ProductLoading extends ProductState{}
class ProductLoaded extends ProductState {
  final UniversalData data;
  ProductLoaded({required this.data});
}

class ProductError extends ProductState{
  final String error;
  ProductError({required this.error});
}

class ProductSingleLoaded extends ProductState{
  final UniversalData data;
  ProductSingleLoaded({required this.data});
}