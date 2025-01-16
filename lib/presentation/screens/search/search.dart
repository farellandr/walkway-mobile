import 'package:flutter/material.dart';
import 'package:walkway_mobile/presentation/widgets/search_navbar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: SearchNavbar(isButton: false),
    );
  }
}