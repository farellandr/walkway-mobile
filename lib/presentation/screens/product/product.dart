import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:walkway_mobile/domain/models/product.dart';
import 'package:walkway_mobile/domain/models/size.dart';
import 'package:walkway_mobile/presentation/widgets/back_navbar.dart';
import 'package:walkway_mobile/utils/constants.dart';
import 'package:walkway_mobile/utils/helpers.dart';
import 'package:walkway_mobile/utils/provider.dart';

class ProductPage extends StatefulWidget {
  final Product? product;
  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final _productStore = Provider.productStore;
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Sizes? _selectedSize;

  @override
  void initState() {
    super.initState();
    _loadData(widget.product!.id);
    _pageController.addListener(_onPageChanged);
  }

  Future<void> _loadData(String id) async {
    await Future.wait([
      _productStore.fetchProductById(id),
    ]);
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

  void _selectSize(Sizes size) {
    setState(() {
      _selectedSize = (_selectedSize == size) ? null : size;
    });
  }

  Widget _buildContent() {
    return Observer(
      builder: (_) {
        if (_productStore.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return SingleChildScrollView(
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
                      itemCount: _productStore.products.first.images.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Image.network(
                            "$baseUrl/upload/${_productStore.products.first.images[index].filename}",
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
                        _productStore.products.first.images.length,
                        (index) => _ImageIndicator(
                          isActive: index == _currentPage,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  spacing: 16.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _Tag(
                          label: _productStore.products.first.brand!.name,
                          isActive: true,
                        ),
                        Row(
                          spacing: 8.0,
                          children: [
                            _Tag(
                                label: _productStore
                                    .products.first.categories[0].name),
                            if (_productStore.products.first.categories.length >
                                1) ...[
                              _Tag(
                                  label: _productStore
                                      .products.first.categories[1].name),
                            ],
                            if (_productStore.products.first.categories.length >
                                2) ...[
                              _Tag(
                                label:
                                    '+${_productStore.products.first.categories.length - 2}',
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                    Column(
                      spacing: 6.0,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Formatter.formatCurrency(
                              _productStore.products.first.price),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.3,
                          ),
                        ),
                        Text(
                          '${_productStore.products.first.brand!.name} ${_productStore.products.first.name}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Select Size",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.2),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Size Guide",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.3,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ..._productStore.products.first.sizes.map(
                                (size) => _SizeOption(
                                  size: size,
                                  isSelected: _selectedSize?.size == size.size,
                                  onTap: () => _selectSize(size),
                                  isAvailable: size.stock > 0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BackNavbar(
        showBack: true,
        showLove: true,
        showCart: true,
      ),
      body: _buildContent(),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: _selectedSize == null
                    ? null
                    : () {
                        _productStore.toogleCart(_selectedSize!.id);
                      },
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Add To Cart',
                  style: TextStyle(
                    color: _selectedSize == null ? Colors.grey : Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(width: 6),
            Expanded(
              child: ElevatedButton(
                onPressed: _selectedSize?.stock == 0
                    ? null
                    : () {
                        _productStore.toogleCart(_selectedSize!.id);
                        Navigator.pushNamed(context, '/checkout');
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _selectedSize == null ? Colors.grey : Color(0xff4E7772),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
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
        color: isActive ? const Color(0xff4E7772) : Colors.grey[200],
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
  final Sizes size;
  final bool isSelected;
  final bool isAvailable;
  final VoidCallback onTap;

  const _SizeOption({
    required this.size,
    required this.onTap,
    required this.isAvailable,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: OutlinedButton(
        onPressed: isAvailable ? onTap : null,
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected ? Colors.teal : null,
          side: BorderSide(
            color: isSelected
                ? Colors.teal
                : isAvailable
                    ? Colors.grey
                    : Colors.grey.withOpacity(0.3),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 6),
          minimumSize: const Size(0, 0),
        ),
        child: Text(
          size.size.toString(),
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : isAvailable
                    ? Colors.black
                    : Colors.grey,
          ),
        ),
      ),
    );
  }
}
