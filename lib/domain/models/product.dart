import 'package:walkway_mobile/domain/models/brand.dart';
import 'package:walkway_mobile/domain/models/category.dart';
import 'package:walkway_mobile/domain/models/image.dart';
import 'package:walkway_mobile/domain/models/size.dart';

class Product {
  final String name;
  final int price;
  final Brand? brand;
  final List<Images> images;
  final List<Category> categories;
  final List<Sizes> sizes;

  Product({
    required this.name,
    required this.price,
    this.brand,
    required this.images,
    required this.categories,
    required this.sizes,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] ?? '',
      price: json['price'] ?? 0,
      brand: json['brand'] != null ? Brand.fromJson(json['brand']) : null,
      images: (json['images'] as List<dynamic>?)
              ?.map((item) => Images.fromJson(item))
              .toList() ??
          [],
      categories: (json['categories'] as List<dynamic>?)
              ?.map((item) => Category.fromJson(item))
              .toList() ??
          [],
      sizes: (json['sizes'] as List<dynamic>?)
              ?.map((item) => Sizes.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'brand': brand?.toJson(),
      'images': images.map((image) => image.toJson()).toList(),
      'categories': categories.map((category) => category.toJson()).toList(),
      'sizes': sizes.map((size) => size.toJson()).toList(),
    };
  }
}
