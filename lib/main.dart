import 'package:flutter/material.dart';
import 'package:walkway_mobile/pages/auth/register.dart';
import 'package:walkway_mobile/pages/home/home.dart';
import 'package:walkway_mobile/pages/product/product.dart';
import 'package:walkway_mobile/pages/profile/profile.dart';

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
      routes: {
        '/home': (context) => HomePage(),
        '/register': (context) => RegisterPage(),
        '/product': (context) => Product(),
        '/profile': (context) => Profile(),
      },
    );
  }
}
