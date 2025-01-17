import 'package:flutter/material.dart';
import 'package:walkway_mobile/domain/models/product.dart';
import 'package:walkway_mobile/presentation/screens/cart/cart.dart';
import 'package:walkway_mobile/presentation/screens/checkout/checkout.dart';
import 'package:walkway_mobile/presentation/screens/home/home.dart';
import 'package:walkway_mobile/presentation/screens/product/product.dart';
import 'package:walkway_mobile/presentation/screens/search/search.dart';

var customRoutes = <String, WidgetBuilder>{
  '/home': (context) => const Home(),
  '/search': (context) {
    final args = ModalRoute.of(context)?.settings.arguments as String;
    return SearchPage(query: args);
  },
  '/product': (context) {
    final args = ModalRoute.of(context)?.settings.arguments as Product?;
    return ProductPage(product: args);
  },
  '/cart': (context) => Cart(),
  '/checkout': (context) => const Checkout(),
};
