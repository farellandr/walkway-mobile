import 'package:flutter/material.dart';
import 'package:walkway_mobile/presentation/routes/routes.dart';

void main() {
  // setupProvider();
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
        fontFamily: 'Montserrat',
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: customRoutes,
    );
  }
}
