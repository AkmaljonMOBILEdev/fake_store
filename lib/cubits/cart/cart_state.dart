part of 'cart_cubit.dart';

class CartState extends Equatable {
  final List<CartSql> productsInCart;
  final num totalCost;
  final num subTotal;
  final num delivery;

  const CartState({
    required this.productsInCart,
    required this.delivery,
    required this.subTotal,
    required this.totalCost,
  });

  CartState copyWith({
    List<CartSql>? item,
    num? delivery,
    num? subTotal,
    num? totalCost,
  }) {
    return CartState(
        productsInCart: item ?? productsInCart,
        delivery: delivery ?? this.delivery,
        subTotal: subTotal ?? this.subTotal,
        totalCost: totalCost ?? this.totalCost);
  }

  @override
  List<Object?> get props => [
        productsInCart,
        delivery,
        subTotal,
        totalCost,
      ];
}
