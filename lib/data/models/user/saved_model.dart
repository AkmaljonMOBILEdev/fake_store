class SavedModel {
  final int productId;
  final int quantity;

  SavedModel({
    required this.productId,
    required this.quantity,
  });

  factory SavedModel.fromJson(Map<String, dynamic> json) {
    return SavedModel(
      productId: json["productId"] ?? 0,
      quantity: json["quantity"] ?? 0,
    );
  }

  Map<String, dynamic> toJson(){
    return {
      "productId":productId,
      "quantity":quantity
    };
  }

}
