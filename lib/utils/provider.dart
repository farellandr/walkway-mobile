import 'package:get_it/get_it.dart';
import 'package:walkway_mobile/domain/services/brand.dart';
import 'package:walkway_mobile/domain/services/product.dart';
import 'package:walkway_mobile/presentation/stores/brand.dart';
import 'package:walkway_mobile/presentation/stores/product.dart';

void setupProvider() {
  GetIt.instance
      .registerSingleton<ProductStore>(ProductStore(ProductService()));
  GetIt.instance.registerSingleton<BrandStore>(BrandStore(BrandService()));
}

class Provider {
  static final ProductStore productStore = GetIt.instance.get<ProductStore>();
  static final BrandStore brandStore = GetIt.instance.get<BrandStore>();
}
