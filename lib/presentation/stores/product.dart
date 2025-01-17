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

  @observable
  ObservableList<String> cartIds = ObservableList<String>();

  @observable
  ObservableList<String> wishlistIds = ObservableList<String>();

  bool isInWishlist(String productId) => wishlistIds.contains(productId);

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

  @action
  Future<void> searchProducts(String query) async {
    isLoading = true;
    error = null;

    try {
      final fetchedProducts = await _productService.searchProducts(query);
      products.clear();
      products.addAll(fetchedProducts);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> fetchProductById(String id) async {
    isLoading = true;
    error = null;

    try {
      final fetchedProduct = await _productService.getProductById(id);
      products.clear();
      products.add(fetchedProduct);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> toogleCart(String id) async {
    isLoading = true;
    error = null;

    try {
      cartIds.add(id);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> fetchCartProducts() async {
    isLoading = true;
    error = null;

    try {
      final fetchedProducts = await _productService.getCartProducts(cartIds);
      products.clear();
      products.addAll(fetchedProducts);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> toggleWishlist(String id) async {
    isLoading = true;
    error = null;

    try {
      if (wishlistIds.contains(id)) {
        wishlistIds.remove(id);
      } else {
        wishlistIds.add(id);
      }
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> fetchWishlistProducts() async {
    isLoading = true;
    error = null;

    try {
      if (wishlistIds.isEmpty) {
        products.clear();
        return;
      }

      final fetchedProducts =
          await _productService.getWishlistProducts(wishlistIds.toList());
      products.clear();
      products.addAll(fetchedProducts);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }
}
