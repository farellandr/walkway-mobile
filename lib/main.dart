import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walkway_mobile/pages/auth/register.dart';
import 'package:walkway_mobile/pages/cart/cart.dart';
import 'package:walkway_mobile/pages/checkout/checkout.dart';
import 'package:walkway_mobile/pages/home/home.dart';
import 'package:walkway_mobile/pages/product/product.dart';
import 'package:walkway_mobile/pages/profile/profile.dart';
import 'package:walkway_mobile/pages/wishlist/wishlist.dart';
import 'package:walkway_mobile/provider/product_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Walkway',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Montserrat',
        ),
        initialRoute: '/home',
        routes: {
          '/home': (context) => HomePage(),
          '/register': (context) => RegisterPage(),
          '/product': (context) => Product(),
          '/profile': (context) => Profile(),
          '/wishlist': (context) => Wishlist(),
          '/checkout': (context) => Checkout(),
          '/cart': (context) => Cart(),
        },
      ),
    );
  }
}
