import 'package:flutter/material.dart';
import 'package:walkway_mobile/domain/models/brand.dart';
import 'package:walkway_mobile/domain/models/product.dart';
import 'package:walkway_mobile/domain/services/brand.dart';
import 'package:walkway_mobile/domain/services/product.dart';
import 'package:walkway_mobile/presentation/widgets/navbar.dart';
import 'package:walkway_mobile/utils/constants.dart';
import 'package:walkway_mobile/utils/helpers.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLoading = true;
  List<Product> _products = [];
  List<Brand> _brands = [];
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final products = await ProductService().getAllProducts();
      final brands = await BrandService().getAllBrands();

      setState(() {
        _products = products;
        _brands = brands.take(8).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Widget _buildContent() {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Color(0xff4E7772)),
            SizedBox(height: 16),
            Text('Loading products...'),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text('Error: $_error'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadProducts,
              child: const Text('Try Again'),
            ),
          ],
        ),
      );
    }

    if (_products.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inventory_2_outlined, size: 48, color: Colors.grey),
            SizedBox(height: 16),
            Text('No products found'),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          Column(
            spacing: 16.0,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: Image.asset('assets/home-banner-1.png'),
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                ),
                itemCount: _brands.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      debugPrint("tapped");
                    },
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          '$baseUrl/upload/${_brands[index].image?.filename}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Column(
                spacing: 0.0,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Recommended for you',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.3),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.east),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ..._products.map(
                          (product) => InkWell(
                            onTap: () {
                              // Provider.of<ProductProvider>(context,
                              //         listen: false)
                              //     .setSelectedProduct(product);
                              // Navigator.pushNamed(context, '/product');
                            },
                            borderRadius: BorderRadius.circular(6),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2 - 18,
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                spacing: 4.0,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          '$baseUrl/upload/${product.images.first.filename}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        top: 0.0,
                                        right: 0.0,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.favorite_outline_rounded,
                                            color: Color(0xff939393),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${product.brand?.name} ${product.name}',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    Formatter.formatCurrency(product.price),
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: -0.2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: RefreshIndicator(
        onRefresh: _loadProducts,
        child: _buildContent(),
      ),
    );
  }
}
