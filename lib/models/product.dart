import 'package:walkway_mobile/models/brand.dart';
import 'package:walkway_mobile/models/category.dart';
import 'package:walkway_mobile/models/size.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final Brand brand;
  final List<Category> categories;
  final List<Size> sizes;
  final List<String> images;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.brand,
    required this.categories,
    required this.sizes,
    required this.images,
  });

  String get fullName => '${brand.name} $name';
}
