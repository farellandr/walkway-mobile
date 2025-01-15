import 'package:mobx/mobx.dart';
import 'package:walkway_mobile/domain/models/product.dart';
import 'package:walkway_mobile/domain/services/product.dart';

part 'product.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {
  final ProductService _productService;

  _ProductStore(this._productService);

  @observable
  ObservableList<Product> products = ObservableList<Product>();

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @action
  Future<void> fetchProducts() async {
    isLoading = true;
    error = null;

    try {
      final fetchedProducts = await _productService.getAllProducts();
      products.clear();
      products.addAll(fetchedProducts);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }
}
