import 'package:flutter/material.dart';
import 'package:walkway_mobile/presentation/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Walkway',
      theme: ThemeData(
        textTheme: ThemeData(fontFamily: 'Montserrat').textTheme,
        useMaterial3: true,
        fontFamily: 'Montserrat',
      ),
      initialRoute: '/home',
      routes: customRoutes,
    );
  }
}
