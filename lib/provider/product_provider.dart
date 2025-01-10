import 'package:flutter/foundation.dart';
import 'package:walkway_mobile/data/data.dart';
import 'package:walkway_mobile/models/product.dart';
import 'package:walkway_mobile/models/wishlist.dart';

class ProductProvider with ChangeNotifier {
  List<Product>? _products;
  Product? _selectedProduct;
  final List<WishlistItem> _wishlist = [];

  List<Product> get products {
    _products ??= Data.products;
    return _products!;
  }

  Product? get selectedProduct => _selectedProduct;

  List<WishlistItem> get wishlist => [..._wishlist];

  List<Product> get wishlistProducts {
    return _wishlist
        .map((item) =>
            products.firstWhere((product) => product.id == item.productId))
        .toList();
  }

  bool isInWishlist(String productId) {
    return _wishlist.any((item) => item.productId == productId);
  }

  void toggleWishlist(String productId) {
    if (isInWishlist(productId)) {
      _wishlist.removeWhere((item) => item.productId == productId);
    } else {
      _wishlist.add(
        WishlistItem(
          productId: productId,
          addedAt: DateTime.now(),
        ),
      );
    }
    notifyListeners();
  }

  List<Product> getWishlistProducts() {
    return products.where((product) => isInWishlist(product.id)).toList();
  }

  List<Product> getWishlistProductsSorted() {
    final wishlistProducts = getWishlistProducts();
    wishlistProducts.sort((a, b) {
      final aDate =
          _wishlist.firstWhere((item) => item.productId == a.id).addedAt;
      final bDate =
          _wishlist.firstWhere((item) => item.productId == b.id).addedAt;
      return bDate.compareTo(aDate); // Most recent first
    });
    return wishlistProducts;
  }

  void setSelectedProduct(Product product) {
    _selectedProduct = product;
    notifyListeners();
  }

  List<Product> getRelatedProducts() {
    if (_selectedProduct == null) return [];
    return products
        .where((product) => product.id != _selectedProduct!.id)
        .toList();
  }
}
