import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:walkway_mobile/presentation/widgets/search_navbar.dart';
import 'package:walkway_mobile/utils/constants.dart';
import 'package:walkway_mobile/utils/helpers.dart';
import 'package:walkway_mobile/utils/provider.dart';

class SearchPage extends StatefulWidget {
  final String query;

  const SearchPage({super.key, required this.query});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _productStore = Provider.productStore;
  late String currentQuery;

  @override
  void initState() {
    super.initState();
    currentQuery = widget.query;
    _searchProducts(widget.query);
  }

  Future<void> _searchProducts(String query) async {
    setState(() {
      currentQuery = query; // Update current query when searching
    });
    await _productStore.searchProducts(query);
  }

  Future<void> _backToHome() async {
    setState(() {
      currentQuery = ""; // Update current query when searching
    });
    await _productStore.searchProducts("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: SearchNavbar(
        showBackButton: true,
        initialQuery: widget.query,
        onSearch: _searchProducts,
        onBack: _backToHome,
      ),
      body: Observer(
        builder: (_) {
          if (_productStore.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xff4E7772)),
            );
          }

          if (_productStore.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error: ${_productStore.error}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => _searchProducts(widget.query),
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          }

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10.0,
                  children: [
                    if (currentQuery.isNotEmpty)
                      Text(
                        'Search results for "$currentQuery"',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    if (_productStore.products.isEmpty)
                      const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search_off,
                                size: 48, color: Colors.grey),
                            SizedBox(height: 16),
                            Text('No products found'),
                          ],
                        ),
                      )
                    else
                      IntrinsicHeight(
                        child: Wrap(
                          children: List.generate(
                            _productStore.products.length,
                            (index) => Material(
                              color: Colors.white,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(6.0),
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/product',
                                    arguments: _productStore.products[index],
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  width: MediaQuery.of(context).size.width / 2 -
                                      16,
                                  child: Column(
                                    spacing: 4.0,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        spacing: 6.0,
                                        children: [
                                          Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  '$baseUrl/upload/${_productStore.products[index].images.first.filename}',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Positioned(
                                                top: 0,
                                                right: 0,
                                                child: IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(Icons
                                                      .favorite_outline_rounded),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '${_productStore.products[index].brand?.name} ${_productStore.products[index].name}',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        Formatter.formatCurrency(_productStore
                                            .products[index].price),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                )
              ],
            ),
          );
          //   Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          // if (currentQuery.isNotEmpty)
          //   Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Text(
          //     'Search results for "$currentQuery"',
          //     style: const TextStyle(
          //       fontSize: 16,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // ),
          // if (_productStore.products.isEmpty)
          //   const Center(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Icon(Icons.search_off, size: 48, color: Colors.grey),
          //         SizedBox(height: 16),
          //         Text('No products found'),
          //       ],
          //     ),
          //   )
          // else
          // IntrinsicHeight(
          //           child: Wrap(
          //             children: List.generate(
          //               _productStore.products.length,
          //               (index) => Material(
          //                 color: Colors.white,
          //                 child: InkWell(
          //                   borderRadius: BorderRadius.circular(6.0),
          //                   onTap: () {
          //                     Navigator.pushNamed(
          //                       context,
          //                       '/product',
          //                       arguments: _productStore.products[index],
          //                     );
          //                   },
          //                   child: Container(
          //                     padding: const EdgeInsets.all(8.0),
          //                     width: MediaQuery.of(context).size.width / 2 -
          //                         16,
          //                     child: Column(
          //                       spacing: 4.0,
          //                       crossAxisAlignment:
          //                           CrossAxisAlignment.start,
          //                       mainAxisAlignment:
          //                           MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         Column(
          //                           crossAxisAlignment:
          //                               CrossAxisAlignment.start,
          //                           spacing: 6.0,
          //                           children: [
          //                             Stack(
          //                               children: [
          //                                 ClipRRect(
          //                                   borderRadius:
          //                                       BorderRadius.circular(8.0),
          //                                   child: Image.network(
          //                                     '$baseUrl/upload/${_productStore.products[index].images.first.filename}',
          //                                     fit: BoxFit.cover,
          //                                   ),
          //                                 ),
          //                                 Positioned(
          //                                   top: 0,
          //                                   right: 0,
          //                                   child: IconButton(
          //                                     onPressed: () {},
          //                                     icon: const Icon(Icons
          //                                         .favorite_outline_rounded),
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                             Text(
          //                               '${_productStore.products[index].brand?.name} ${_productStore.products[index].name}',
          //                               maxLines: 2,
          //                               overflow: TextOverflow.ellipsis,
          //                               style:
          //                                   const TextStyle(fontSize: 14),
          //                             ),
          //                           ],
          //                         ),
          //                         Text(
          //                           Formatter.formatCurrency(_productStore
          //                               .products[index].price),
          //                           maxLines: 2,
          //                           overflow: TextOverflow.ellipsis,
          //                           style: const TextStyle(
          //                             fontSize: 14,
          //                             fontWeight: FontWeight.w500,
          //                             letterSpacing: -0.25,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //   ],
          // );
        },
      ),
    );
  }
}
