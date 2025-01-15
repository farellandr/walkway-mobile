import 'package:flutter/material.dart';
import 'package:walkway_mobile/domain/models/brand.dart';
import 'package:walkway_mobile/domain/models/product.dart';
import 'package:walkway_mobile/domain/services/brand.dart';
import 'package:walkway_mobile/domain/services/product.dart';
import 'package:walkway_mobile/presentation/widgets/search_navbar.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 12.0),
          Column(
            spacing: 10.0,
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
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: List.generate(
                          _products.length,
                          (index) => Material(
                            color: Colors.white,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(6.0),
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/product',
                                  arguments: _products[index],
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                width:
                                    MediaQuery.of(context).size.width / 2 - 16,
                                child: Column(
                                  spacing: 4.0,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        spacing: 6.0,
                                        children: [
                                          Stack(children: [
                                            ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                    '$baseUrl/upload/${_products[index].images.first.filename}',
                                                    fit: BoxFit.cover)),
                                            Positioned(
                                                top: 0,
                                                right: 0,
                                                child: IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(Icons
                                                        .favorite_outline_rounded)))
                                          ]),
                                          Text(
                                              '${_products[index].brand?.name} ${_products[index].name}',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 14)),
                                        ]),
                                    Text(
                                        Formatter.formatCurrency(
                                            _products[index].price),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.25)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: Image.asset('assets/home-banner-2.png'),
              ),
              Column(
                spacing: 0.0,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Our Collection',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.3),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('See all',
                            style: TextStyle(color: Colors.grey[600])),
                      ),
                    ],
                  ),
                  IntrinsicHeight(
                    child: Wrap(
                      children: List.generate(
                        _products.length,
                        (index) => Material(
                          color: Colors.white,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(6.0),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/product',
                                arguments: _products[index],
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              width: MediaQuery.of(context).size.width / 2 - 16,
                              child: Column(
                                spacing: 4.0,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      spacing: 6.0,
                                      children: [
                                        Stack(children: [
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                  '$baseUrl/upload/${_products[index].images.first.filename}',
                                                  fit: BoxFit.cover)),
                                          Positioned(
                                              top: 0,
                                              right: 0,
                                              child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons
                                                      .favorite_outline_rounded)))
                                        ]),
                                        Text(
                                            '${_products[index].brand?.name} ${_products[index].name}',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                const TextStyle(fontSize: 14)),
                                      ]),
                                  Text(
                                      Formatter.formatCurrency(
                                          _products[index].price),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.25)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              // spacer
              const SizedBox(height: 12.0),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const SearchNavbar(),
      body: RefreshIndicator(
        onRefresh: _loadProducts,
        child: _buildContent(),
      ),
    );
  }
}
