import 'package:fake_store/data/models/user/saved_model.dart';

class UserInCartModel {
  final int id;
  final int userId;
  final String date;
  final List<SavedModel> products;

  UserInCartModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  factory UserInCartModel.fromJson(Map<String, dynamic> json) {
    var productsFromJson = json['products'] as List<dynamic>? ?? [];
    List<SavedModel> productsList = productsFromJson
        .map((productJson) => SavedModel.fromJson(productJson))
        .toList();
    return UserInCartModel(
      id: json["id"] ?? 0,
      userId: json["userId"] ?? 0,
      date: json["date"] ?? "",
      products: productsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'date': date,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }

}
