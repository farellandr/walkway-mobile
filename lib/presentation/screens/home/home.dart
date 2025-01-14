import 'package:flutter/material.dart';
import 'package:walkway_mobile/domain/models/product.dart';
import 'package:walkway_mobile/domain/services/product.dart';
import 'package:walkway_mobile/presentation/widgets/navbar.dart';
import 'package:walkway_mobile/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = ProductService().getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: FutureBuilder<List<Product>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products found.'));
          } else {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  leading: product.images.isNotEmpty
                      ? Image.network(
                          '$baseUrl/upload/${product.images.first.filename}',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.image),
                  title: Text('${product.brand?.name} ${product.name}'),
                  subtitle: Text('\$${product.price}'),
                  onTap: () {},
                );
              },
            );
          }
        },
      ),
    );
  }
}
