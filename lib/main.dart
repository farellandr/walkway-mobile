import 'package:flutter/material.dart';
import 'package:walkway_mobile/custom_page_route.dart';
import 'package:walkway_mobile/pages/auth/register.dart';
import 'package:walkway_mobile/pages/home/home.dart';
import 'package:walkway_mobile/pages/product/product.dart';
import 'package:walkway_mobile/pages/profile/profile.dart';
import 'package:walkway_mobile/pages/wishlist/wishlist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Montserrat',
      ),
      initialRoute: '/home',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/home':
            return SlidePageRoute(page: const HomePage());
          case '/register':
            return SlidePageRoute(page: const RegisterPage());
          case '/product':
            return SlidePageRoute(page: const Product());
          case '/profile':
            return SlidePageRoute(
              page: const Profile(),
              direction: SlideDirection.up,
            );
          case '/wishlist':
            return SlidePageRoute(
              page: const Wishlist(),
              direction: SlideDirection.left,
            );
          default:
            return null;
        }
      },
    );
  }
}
