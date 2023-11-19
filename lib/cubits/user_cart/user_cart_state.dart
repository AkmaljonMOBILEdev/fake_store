part of 'user_cart_cubit.dart';

class UserCartState extends Equatable {
  final List<UserInCartModel> first;
  final List<UserInCartModel> second;
  final List<UserInCartModel> third;
  final List<UserInCartModel> fourth;

  final List<ProductModel> firstProducts;
  final List<ProductModel> secondProducts;
  final List<ProductModel> thirdProducts;
  final List<ProductModel> fourthProducts;

  const UserCartState({
    required this.first,
    required this.second,
    required this.third,
    required this.fourth,
    required this.firstProducts,
    required this.secondProducts,
    required this.thirdProducts,
    required this.fourthProducts,
  });

  UserCartState copyWith({
    List<UserInCartModel>? first,
    List<UserInCartModel>? second,
    List<UserInCartModel>? third,
    List<UserInCartModel>? fourth,
    List<ProductModel>? firstProducts,
    List<ProductModel>? secondProducts,
    List<ProductModel>? thirdProducts,
    List<ProductModel>? fourthProducts,
  }) {
    return UserCartState(
      first: first ?? this.first,
      second: second ?? this.second,
      third: third ?? this.third,
      fourth: fourth ?? this.fourth,
      firstProducts: firstProducts ?? this.firstProducts,
      secondProducts: secondProducts ?? this.secondProducts,
      thirdProducts: thirdProducts ?? this.thirdProducts,
      fourthProducts: fourthProducts ?? this.fourthProducts,
    );
  }

  @override
  List<Object?> get props => [
        first,
        second,
        third,
        fourth,
        firstProducts,
        secondProducts,
        thirdProducts,
        fourthProducts,
      ];
}
