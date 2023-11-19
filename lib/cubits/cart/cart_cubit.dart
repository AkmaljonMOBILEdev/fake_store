import 'package:equatable/equatable.dart';
import 'package:fake_store/data/local/db/local_database.dart';
import 'package:fake_store/data/models/cart_sql/cart_sql.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/product/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit()
      : super(const CartState(
          productsInCart: [],
          delivery: 0,
          subTotal: 0,
          totalCost: 0,
        )) {
    getFromCart();
    countPrices();
  }

  Future<void> addToCart(ProductModel newProduct) async {
    CartSql cartSql = CartSql(
      title: newProduct.title,
      price: newProduct.price,
      description: newProduct.description,
      category: newProduct.category,
      image: newProduct.image,
      ratingRate: newProduct.rating.rate,
      ratingCount: newProduct.rating.count,
    );
    await LocalDatabase.insert(cartSql);
    getFromCart();
  }

  Future<void> deleteFromCart(int id) async {
    await LocalDatabase.delete(id);
    getFromCart();
  }

  Future<void> deleteAll()async{
    await LocalDatabase.deleteAll();
    getFromCart();
  }

  Future<void> getFromCart() async {
    List<CartSql> items = await LocalDatabase.getAll();
    emit(state.copyWith(item: items));
    countPrices();
  }

   countPrices(){
    num theSubTotal = state.productsInCart.fold(0.0, (previousValue, element) => previousValue + element.price);
    num delivery = state.productsInCart.length * 7.5;
    emit(state.copyWith(subTotal: theSubTotal));
    emit(state.copyWith(delivery: delivery));
    emit(state.copyWith(totalCost: delivery+theSubTotal));
  }

}
