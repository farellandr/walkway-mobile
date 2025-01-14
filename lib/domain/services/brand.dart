import 'package:walkway_mobile/domain/models/brand.dart';
import 'package:walkway_mobile/utils/constants.dart';
import 'package:walkway_mobile/utils/dio.dart';

class BrandService {
  Future<List<Brand>> getAllBrands() async {
    try {
      final response = await dio.get("$baseUrl/brand");

      final brands = (response.data['data'] as List)
          .map((item) => Brand.fromJson(item))
          .toList();

      return brands;
    } catch (e) {
      throw Exception("Failed to fetch brands: $e");
    }
  }
}
