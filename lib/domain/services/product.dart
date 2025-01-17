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

  Future<List<Product>> searchProducts(String query) async {
    try {
      final response = await dio.get("$baseUrl/product", 
        queryParameters: query.isNotEmpty ? {"search": query} : null
      );

      final products = (response.data['data'] as List)
          .map((item) => Product.fromJson(item))
          .toList();

      return products;
    } catch (e) {
      throw Exception("Failed to fetch products: $e");
    }
  }

  Future<Product> getProductById(String id) async {
    try {
      final response = await dio.get("$baseUrl/product/$id");

      final product = Product.fromJson(response.data['data']);

      return product;
    } catch (e) {
      throw Exception("Failed to fetch product: $e");
    }
  }

  Future<List<Product>> getCartProducts(List<String> ids) async {
    try {
      final response = await dio.post(
        "$baseUrl/product/cart",
        data: {"ids": ids},
      );

      final products = (response.data['data'] as List)
          .map((item) => Product.fromJson(item))
          .toList();

      return products;
    } catch (e) {
      throw Exception("Failed to fetch products: $e");
    }
  }

  Future<List<Product>> getWishlistProducts(List<String> ids) async {
    try {
      final response = await dio.post(
        "$baseUrl/product/wishlist",
        data: {"ids": ids},
      );

      final products = (response.data['data'] as List)
          .map((item) => Product.fromJson(item))
          .toList();

      return products;
    } catch (e) {
      throw Exception("Failed to fetch products: $e");
    }
  }

}
