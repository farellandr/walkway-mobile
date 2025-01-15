import 'package:flutter/material.dart';
import 'package:walkway_mobile/domain/models/product.dart';
import 'package:walkway_mobile/presentation/screens/home/home.dart';
import 'package:walkway_mobile/presentation/screens/product/product.dart';

var customRoutes = <String, WidgetBuilder>{
  '/home': (context) => const Home(),
  '/product': (context) {
    final args = ModalRoute.of(context)?.settings.arguments as Product?;
    return ProductPage(product: args);
  },
};
