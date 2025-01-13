import 'package:flutter/foundation.dart';
import 'package:walkway_mobile/data/data.dart';
import 'package:walkway_mobile/models/cart.dart';
import 'package:walkway_mobile/models/checkout.dart';
import 'package:walkway_mobile/models/product.dart';
import 'package:walkway_mobile/models/wishlist.dart';

class ProductProvider with ChangeNotifier {
  List<Product>? _products;
  Product? _selectedProduct;
  final List<WishlistItem> _wishlist = [];
  final List<CartItem> _cartItem = [];
  final List<CheckoutItem> _checkoutItem = [];
  final Set<String> _checkedCartItems = {};

  List<Product> get products {
    _products ??= Data.products;
    return _products!;
  }

  Product? get selectedProduct => _selectedProduct;

  List<WishlistItem> get wishlist => [..._wishlist];
  List<CartItem> get cartItem => [..._cartItem];

  List<Product> get wishlistProducts {
    return _wishlist
        .map((item) =>
            products.firstWhere((product) => product.id == item.productId))
        .toList();
  }

  bool isInCartItem(String productId) {
    return _cartItem.any((item) => item.productId == productId);
  }

  void addCartItem(String productId, String sizeId) {
    if (isInCartItem(productId)) return;
    _cartItem.add(
      CartItem(
        sizeId: sizeId,
        productId: productId,
        quantity: 1,
        addedAt: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  List<Product> getCartItems() {
    return products.where((product) => isInCartItem(product.id)).toList();
  }

  List<Product> getCartItemsSorted() {
    final cartItems = getCartItems();
    cartItems.sort((a, b) {
      final aDate =
          _cartItem.firstWhere((item) => item.productId == a.id).addedAt;
      final bDate =
          _cartItem.firstWhere((item) => item.productId == b.id).addedAt;
      return bDate.compareTo(aDate); // Most recent first
    });
    return cartItems;
  }

  Set<String> get checkedCartItems => _checkedCartItems;

  bool isItemChecked(String productId) {
    return _checkedCartItems.contains(productId);
  }

  void toggleCartItemCheck(String productId) {
    if (_checkedCartItems.contains(productId)) {
      _checkedCartItems.remove(productId);
    } else {
      _checkedCartItems.add(productId);
    }
    notifyListeners();
  }

  double getCheckedItemsTotal() {
    return getCartItems()
        .where((product) => _checkedCartItems.contains(product.id))
        .fold(0, (sum, product) => sum + product.price);
  }

  List<CheckoutItem> get checkoutItems => _checkoutItem;

  void addCheckoutItem(CheckoutItem checkoutItem) {
    _checkoutItem.add(checkoutItem);
    notifyListeners();
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
