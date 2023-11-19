part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class FetchAllProducts extends ProductEvent{
  final String category;
  FetchAllProducts({required this.category});
}

class GetProductByID extends ProductEvent{
  final int id;
  GetProductByID({required this.id});
}
