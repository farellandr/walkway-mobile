import 'package:walkway_mobile/domain/models/product.dart';

class Sizes {
  final int size;
  final int stock;
  final Product? product;

  Sizes({
    required this.size,
    required this.stock,
    this.product,
  });

  factory Sizes.fromJson(Map<String, dynamic> json) {
    return Sizes(
      size: json['size'] ?? 0,
      stock: json['stock'] ?? 0,
      product:
          json['product'] != null ? Product.fromJson(json['product']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'size': size,
      'stock': stock,
      'product': product?.toJson(),
    };
  }
}
