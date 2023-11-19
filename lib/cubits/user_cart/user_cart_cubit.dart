import 'package:equatable/equatable.dart';
import 'package:fake_store/data/network/api_service.dart';
import 'package:fake_store/services/service_locator/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/product/product_model.dart';
import '../../data/models/user/user_in_cart.dart';

part 'user_cart_state.dart';

class UserCartCubit extends Cubit<UserCartState> {
  UserCartCubit()
      : super(
          const UserCartState(
            first: [],
            second: [],
            third: [],
            fourth: [],
            firstProducts: [],
            secondProducts: [],
            thirdProducts: [],
            fourthProducts: [],
          ),
        );

  Future<void> getAllUserInfo() async {
    var userInfo = await getIt.get<ApiService>().getUserInfo(1);
    List<UserInCartModel> firstUser = userInfo.data as List<UserInCartModel>;
    emit(state.copyWith(first: firstUser));

    userInfo = await getIt.get<ApiService>().getUserInfo(2);
    List<UserInCartModel> secondUser = userInfo.data as List<UserInCartModel>;
    emit(state.copyWith(second: secondUser));

    userInfo = await getIt.get<ApiService>().getUserInfo(3);
    List<UserInCartModel> thirdUser = userInfo.data as List<UserInCartModel>;
    emit(state.copyWith(third: thirdUser));

    userInfo = await getIt.get<ApiService>().getUserInfo(4);
    List<UserInCartModel> fourthUser = userInfo.data as List<UserInCartModel>;
    emit(state.copyWith(fourth: fourthUser));
  }

  Future<void> getProductsOfFirstUser() async {
    List<ProductModel> currentList = [];
    if(state.first.isNotEmpty){
      for (int j = 0; j < state.first.length; j++) {
        if(state.first[j].products.isNotEmpty){
          for (int i = 0; i < state.first[j].products.length; i++) {
            var theProduct = await getIt
                .get<ApiService>()
                .getProductById(state.first[j].products[i].productId);
            currentList.add(theProduct.data);
          }
        }
      }
    }
    emit(state.copyWith(firstProducts: currentList));
  }

  Future<void> getProductsOfSecondUser() async {
    List<ProductModel> currentList = [];
    if(state.second.isNotEmpty){
      for (int j = 0; j < state.second.length; j++) {
        if(state.second[j].products.isNotEmpty){
          for (int i = 0; i < state.second[j].products.length; i++) {
            var theProduct = await getIt
                .get<ApiService>()
                .getProductById(state.second[j].products[i].productId);
            currentList.add(theProduct.data);
          }
        }
      }
    }
    emit(state.copyWith(secondProducts: currentList));
  }

  Future<void> getProductsOfThirdUser() async {
    List<ProductModel> currentList = [];
    if(state.third.isNotEmpty){
      for (int j = 0; j < state.third.length; j++) {
        if(state.third[j].products.isNotEmpty){
          for (int i = 0; i < state.third[j].products.length; i++) {
            var theProduct = await getIt
                .get<ApiService>()
                .getProductById(state.third[j].products[i].productId);
            currentList.add(theProduct.data);
          }
        }
      }
    }
    emit(state.copyWith(thirdProducts: currentList));
  }

  Future<void> getProductsOfFourthUser() async {
    List<ProductModel> currentList = [];
    if(state.fourth.isNotEmpty){
      for (int j = 0; j < state.fourth.length; j++) {
        if(state.fourth[j].products.isNotEmpty){
          for (int i = 0; i < state.fourth[j].products.length; i++) {
            var theProduct = await getIt
                .get<ApiService>()
                .getProductById(state.fourth[j].products[i].productId);
            currentList.add(theProduct.data);
          }
        }
      }
    }
    emit(state.copyWith(fourthProducts: currentList));
  }

  void callAllMethods(){
    getAllUserInfo();
    getProductsOfFirstUser();
    getProductsOfSecondUser();
    getProductsOfThirdUser();
    getProductsOfFourthUser();
  }

}
