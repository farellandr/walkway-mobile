// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductStore on _ProductStore, Store {
  late final _$productsAtom =
      Atom(name: '_ProductStore.products', context: context);

  @override
  ObservableList<Product> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<Product> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ProductStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorAtom = Atom(name: '_ProductStore.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$cartIdsAtom =
      Atom(name: '_ProductStore.cartIds', context: context);

  @override
  ObservableList<String> get cartIds {
    _$cartIdsAtom.reportRead();
    return super.cartIds;
  }

  @override
  set cartIds(ObservableList<String> value) {
    _$cartIdsAtom.reportWrite(value, super.cartIds, () {
      super.cartIds = value;
    });
  }

  late final _$wishlistIdsAtom =
      Atom(name: '_ProductStore.wishlistIds', context: context);

  @override
  ObservableList<String> get wishlistIds {
    _$wishlistIdsAtom.reportRead();
    return super.wishlistIds;
  }

  @override
  set wishlistIds(ObservableList<String> value) {
    _$wishlistIdsAtom.reportWrite(value, super.wishlistIds, () {
      super.wishlistIds = value;
    });
  }

  late final _$fetchProductsAsyncAction =
      AsyncAction('_ProductStore.fetchProducts', context: context);

  @override
  Future<void> fetchProducts() {
    return _$fetchProductsAsyncAction.run(() => super.fetchProducts());
  }

  late final _$searchProductsAsyncAction =
      AsyncAction('_ProductStore.searchProducts', context: context);

  @override
  Future<void> searchProducts(String query) {
    return _$searchProductsAsyncAction.run(() => super.searchProducts(query));
  }

  late final _$fetchProductByIdAsyncAction =
      AsyncAction('_ProductStore.fetchProductById', context: context);

  @override
  Future<void> fetchProductById(String id) {
    return _$fetchProductByIdAsyncAction.run(() => super.fetchProductById(id));
  }

  late final _$toogleCartAsyncAction =
      AsyncAction('_ProductStore.toogleCart', context: context);

  @override
  Future<void> toogleCart(String id) {
    return _$toogleCartAsyncAction.run(() => super.toogleCart(id));
  }

  late final _$fetchCartProductsAsyncAction =
      AsyncAction('_ProductStore.fetchCartProducts', context: context);

  @override
  Future<void> fetchCartProducts() {
    return _$fetchCartProductsAsyncAction.run(() => super.fetchCartProducts());
  }

  late final _$toggleWishlistAsyncAction =
      AsyncAction('_ProductStore.toggleWishlist', context: context);

  @override
  Future<void> toggleWishlist(String id) {
    return _$toggleWishlistAsyncAction.run(() => super.toggleWishlist(id));
  }

  late final _$fetchWishlistProductsAsyncAction =
      AsyncAction('_ProductStore.fetchWishlistProducts', context: context);

  @override
  Future<void> fetchWishlistProducts() {
    return _$fetchWishlistProductsAsyncAction
        .run(() => super.fetchWishlistProducts());
  }

  @override
  String toString() {
    return '''
products: ${products},
isLoading: ${isLoading},
error: ${error},
cartIds: ${cartIds},
wishlistIds: ${wishlistIds}
    ''';
  }
}
