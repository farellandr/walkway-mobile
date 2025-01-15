// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BrandStore on _BrandStore, Store {
  late final _$brandsAtom = Atom(name: '_BrandStore.brands', context: context);

  @override
  ObservableList<Brand> get brands {
    _$brandsAtom.reportRead();
    return super.brands;
  }

  @override
  set brands(ObservableList<Brand> value) {
    _$brandsAtom.reportWrite(value, super.brands, () {
      super.brands = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_BrandStore.isLoading', context: context);

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

  late final _$errorAtom = Atom(name: '_BrandStore.error', context: context);

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

  late final _$fetchBrandsAsyncAction =
      AsyncAction('_BrandStore.fetchBrands', context: context);

  @override
  Future<void> fetchBrands() {
    return _$fetchBrandsAsyncAction.run(() => super.fetchBrands());
  }

  @override
  String toString() {
    return '''
brands: ${brands},
isLoading: ${isLoading},
error: ${error}
    ''';
  }
}
