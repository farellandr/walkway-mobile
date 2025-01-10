import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walkway_mobile/helpers/formatter.dart';
import 'package:walkway_mobile/provider/product_provider.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  String _selectedSize = '4';

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    final page = _pageController.page?.round() ?? 0;
    if (_currentPage != page) {
      setState(() {
        _currentPage = page;
      });
    }
  }

  void _selectSize(String size) {
    setState(() {
      _selectedSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final product = productProvider.selectedProduct;

    if (product == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Product Not Found')),
        body: Center(child: Text('No product selected')),
      );
    }

    final relatedProducts = productProvider.getRelatedProducts();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_border_rounded,
              color: Color(0xff939393),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Color(0xff939393),
            ),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            color: Colors.grey[300],
            height: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  color: Color(0xfff5f5f5),
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: product.images.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Image.asset(
                          product.images[index],
                          fit: BoxFit.contain,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      product.images.length,
                      (index) => _ImageIndicator(
                        isActive: index == _currentPage,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
              child: Column(
                spacing: 20.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _Tag(
                        label: product.brand.name,
                        isActive: true,
                      ),
                      Row(
                        spacing: 8.0,
                        children: [
                          _Tag(label: product.categories[0].name),
                          _Tag(label: product.categories[1].name),
                          if (product.categories.length > 2)
                            _Tag(
                              label: '+${product.categories.length - 2}',
                            ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    spacing: 8.0,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Formatter.formatCurrency(product.price),
                        style: TextStyle(
                          fontSize: 24,
                          letterSpacing: -0.3,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        product.fullName,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff606060),
                          letterSpacing: -0.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Column(
                    spacing: .0,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Size',
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: -0.3,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...product.sizes.map(
                              (size) => _SizeOption(
                                size: size.size.toString(),
                                isSelected:
                                    size.size.toString() == _selectedSize,
                                onTap: () => _selectSize(size.size.toString()),
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Related Products",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                  letterSpacing: -0.3,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.east,
                                  color: Color(0xff939393),
                                ),
                                onPressed: () {},
                              )
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...relatedProducts.map(
                                  (relatedProduct) => InkWell(
                                    onTap: () {
                                      Provider.of<ProductProvider>(context,
                                              listen: false)
                                          .setSelectedProduct(product);
                                      setState(() {});
                                      // _scrollController.animateTo(
                                      //   0,
                                      //   duration: Duration(milliseconds: 300),
                                      //   curve: Curves.easeInOut,
                                      // );
                                      Navigator.pushNamed(context, '/product');
                                    },
                                    borderRadius: BorderRadius.circular(6),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          18,
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        spacing: 4.0,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                  relatedProduct.images[0],
                                                ),
                                              ),
                                              Positioned(
                                                top: 0.0,
                                                right: 0.0,
                                                child: IconButton(
                                                  icon: Icon(
                                                    productProvider
                                                            .isInWishlist(
                                                                relatedProduct
                                                                    .id)
                                                        ? Icons.favorite_rounded
                                                        : Icons
                                                            .favorite_outline_rounded,
                                                    color: productProvider
                                                            .isInWishlist(
                                                                relatedProduct
                                                                    .id)
                                                        ? Colors.red
                                                        : Color(0xff939393),
                                                  ),
                                                  onPressed: () {
                                                    productProvider
                                                        .toggleWishlist(
                                                            relatedProduct.id);
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            relatedProduct.fullName,
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            Formatter.formatCurrency(
                                                relatedProduct.price),
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
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          spacing: 6,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Less border radius
                  ),
                ),
                child:
                    Text('Add To Cart', style: TextStyle(color: Colors.black)),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff4E7772),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Less border radius
                  ),
                ),
                child: Text(
                  'Checkout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: Image.asset(
                  'assets/nike-sneakers.png',
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
            "Nike Dunk Low Vintage Green",
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "Rp 1,100,000",
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.2,
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageIndicator extends StatelessWidget {
  final bool isActive;

  const _ImageIndicator({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: isActive ? 24 : 14,
      height: 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isActive ? const Color(0xff4E7772) : Colors.grey[300],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String label;
  final bool isActive;

  const _Tag({required this.label, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? Color(0xff4E7772) : Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: isActive ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

class _SizeOption extends StatelessWidget {
  final String size;
  final bool isSelected;
  final VoidCallback onTap;

  const _SizeOption({
    required this.size,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected ? Colors.teal : null,
          side: BorderSide(
            color: isSelected ? Colors.teal : Colors.grey,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 6),
          minimumSize: const Size(0, 0),
        ),
        child: Text(
          size,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
