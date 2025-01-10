import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walkway_mobile/helpers/formatter.dart';
import 'package:walkway_mobile/provider/product_provider.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final products = productProvider.products;
    final wishListProducts = productProvider.getWishlistProductsSorted();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Text(
            'Wishlist',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
              letterSpacing: -0.3,
            ),
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Container(
              color: Colors.grey[300],
              height: 1,
            ),
          ),
        ),
        body: ListView(
          children: [
            wishListProducts.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 220,
                          height: 220,
                          child: Image.asset('assets/empty-wishlist.png'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4A766E),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Add your Wishlist',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        ...wishListProducts.map((product) {
                          return InkWell(
                            onTap: () {
                              Provider.of<ProductProvider>(context,
                                      listen: false)
                                  .setSelectedProduct(product);
                              Navigator.pushNamed(context, '/product');
                            },
                            borderRadius: BorderRadius.circular(6),
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[200],
                              ),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      product.images[0].toString(),
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 12.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.fullName,
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4.0),
                                        Text(
                                          Formatter.formatCurrency(
                                              product.price),
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      productProvider.isInWishlist(product.id)
                                          ? Icons.favorite_rounded
                                          : Icons.favorite_outline_rounded,
                                      color: productProvider
                                              .isInWishlist(product.id)
                                          ? Colors.red
                                          : const Color(0xff939393),
                                    ),
                                    onPressed: () {
                                      productProvider
                                          .toggleWishlist(product.id);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Recommended for you",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          letterSpacing: -0.3,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // ignore: avoid_print
                          print("See All");
                        },
                        child: const Text(
                          "See All",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    children: [
                      ...products.map(
                        (product) => InkWell(
                          onTap: () {
                            Provider.of<ProductProvider>(context, listen: false)
                                .setSelectedProduct(product);
                            Navigator.pushNamed(context, '/product');
                          },
                          borderRadius: BorderRadius.circular(6),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2 - 18,
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        product.images[0].toString(),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0.0,
                                      right: 0.0,
                                      child: IconButton(
                                        icon: Icon(
                                          productProvider
                                                  .isInWishlist(product.id)
                                              ? Icons.favorite_rounded
                                              : Icons.favorite_outline_rounded,
                                          color: productProvider
                                                  .isInWishlist(product.id)
                                              ? Colors.red
                                              : const Color(0xff939393),
                                        ),
                                        onPressed: () {
                                          productProvider
                                              .toggleWishlist(product.id);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  product.fullName,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  Formatter.formatCurrency(product.price),
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -0.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigation());
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home_rounded,
                        color: Color(0xff939393),
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                          color: Color(0xff939393),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.gavel_rounded,
                        color: Color(0xff939393),
                      ),
                      Text(
                        "Aunction",
                        style: TextStyle(
                          color: Color(0xff939393),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_rounded,
                        color: Color(0xff242424),
                      ),
                      Text(
                        "Wishlist",
                        style: TextStyle(
                          color: Color(0xff242424),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_2_rounded,
                        color: Color(0xff939393),
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(
                          color: Color(0xff939393),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
