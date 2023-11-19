class CartModelFields {
  static const String id = "_id";
  static const String title = "title";
  static const String price = "price";
  static const String description = "description";
  static const String category = "category";
  static const String image = "image";
  static const String ratingRate = "rating_rate";
  static const String ratingCount = "rating_count";

  static const String cartTable = "cart_table";
}

class CartSql {
  int? id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final num ratingRate;
  final int ratingCount;

  CartSql({
    this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.ratingRate,
    required this.ratingCount,
  });

  CartSql copyWith({
    String? title,
    String? description,
    String? category,
    String? image,
    num? price,
    num? ratingRate,
    int? ratingCount,
    int? id,
  }) {
    return CartSql(
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      ratingCount: ratingCount ??this.ratingCount,
      ratingRate: ratingRate ??this.ratingRate,
      id: id ?? this.id,
    );
  }

  factory CartSql.fromJson(Map<String, dynamic> json) {
    return CartSql(
      title: json[CartModelFields.title] ?? "",
      price: json[CartModelFields.price] ?? 0,
      description: json[CartModelFields.description] ?? "",
      category: json[CartModelFields.category] ?? "",
      image: json[CartModelFields.image] ?? "",
      ratingRate: json[CartModelFields.ratingRate] ?? 0,
      ratingCount: json[CartModelFields.ratingCount] ?? 0,
      id: json[CartModelFields.id] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      CartModelFields.title: title,
      CartModelFields.price: price,
      CartModelFields.description: description,
      CartModelFields.category: category,
      CartModelFields.image: image,
      CartModelFields.ratingRate: ratingRate,
      CartModelFields.ratingCount: ratingCount,
    };
  }

  @override
  String toString() {
    return '''
      title: $title,
      price: $price,
      description: $description,
      category: $category,
      image: $image,
      ratingRate: $ratingCount,
      ratingCount: $ratingRate,
      id: $id, 
    ''';
  }
}

