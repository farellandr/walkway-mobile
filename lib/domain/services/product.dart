import 'package:walkway_mobile/domain/models/product.dart';
import 'package:walkway_mobile/utils/constants.dart';
import 'package:walkway_mobile/utils/dio.dart';

class ProductService {
  Future<List<Product>> getAllProducts() async {
    try {
      final response = await dio.get("$baseUrl/product");

      final products = (response.data['data'] as List)
          .map((item) => Product.fromJson(item))
          .toList();

      return products;
    } catch (e) {
      throw Exception("Failed to fetch products: $e");
    }
  }

  Future<List<Product>> searchProducts(String search) async {
    try {
      final response = await dio.get("$baseUrl/product?search=$search");

      final products = (response.data['data'] as List)
          .map((item) => Product.fromJson(item))
          .toList();

      return products;
    } catch (e) {
      throw Exception("Failed to fetch products: $e");
    }
  }
}
