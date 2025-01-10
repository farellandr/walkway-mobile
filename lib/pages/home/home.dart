import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walkway_mobile/helpers/formatter.dart';
import 'package:walkway_mobile/provider/product_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final products = productProvider.products;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Navigation(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
                children: [
                  Column(
                    spacing: 8.0,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset('assets/home-banner-1.png'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Recommended for you",
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
                                ...products.map(
                                  (product) => InkWell(
                                    onTap: () {
                                      Provider.of<ProductProvider>(context,
                                              listen: false)
                                          .setSelectedProduct(product);
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
                                                  product.images[0].toString(),
                                                ),
                                              ),
                                              Positioned(
                                                top: 0.0,
                                                right: 0.0,
                                                child: IconButton(
                                                  icon: Icon(
                                                    productProvider
                                                            .isInWishlist(
                                                                product.id)
                                                        ? Icons.favorite_rounded
                                                        : Icons
                                                            .favorite_outline_rounded,
                                                    color: productProvider
                                                            .isInWishlist(
                                                                product.id)
                                                        ? Colors.red
                                                        : Color(0xff939393),
                                                  ),
                                                  onPressed: () {
                                                    productProvider
                                                        .toggleWishlist(
                                                            product.id);
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            product.fullName,
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            Formatter.formatCurrency(
                                                product.price),
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset('assets/home-banner-2.png'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Aunction",
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
                                ...List.generate(
                                  5,
                                  (index) => InkWell(
                                    onTap: () {
                                      // ignore: avoid_print
                                      print(index);
                                    },
                                    borderRadius: BorderRadius.circular(6),
                                    child: BidCard(),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset('assets/home-banner-3.png'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Our Collection",
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
                                child: Text(
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
                                    Provider.of<ProductProvider>(context,
                                            listen: false)
                                        .setSelectedProduct(product);
                                    Navigator.pushNamed(context, '/product');
                                  },
                                  borderRadius: BorderRadius.circular(6),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
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
                                                product.images[0].toString(),
                                              ),
                                            ),
                                            Positioned(
                                              top: 0.0,
                                              right: 0.0,
                                              child: IconButton(
                                                icon: Icon(
                                                  productProvider.isInWishlist(
                                                          product.id)
                                                      ? Icons.favorite_rounded
                                                      : Icons
                                                          .favorite_outline_rounded,
                                                  color: productProvider
                                                          .isInWishlist(
                                                              product.id)
                                                      ? Colors.red
                                                      : Color(0xff939393),
                                                ),
                                                onPressed: () {
                                                  productProvider
                                                      .toggleWishlist(
                                                          product.id);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          product.fullName,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          Formatter.formatCurrency(
                                              product.price),
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
                              ),
                            ],
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
      bottomNavigationBar: BottomNavigation(),
    );
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
        Container(
          height: 1,
          color: Colors.grey[300],
        ),
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
                        color: Color(0xff242424),
                      ),
                      Text(
                        "Home",
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
                onTap: () {
                  Navigator.pushNamed(context, '/wishlist');
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_border_rounded,
                        color: Color(0xff939393),
                      ),
                      Text(
                        "Wishlist",
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

class BidCard extends StatelessWidget {
  const BidCard({
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
                  'assets/images/sneakers/530-ivory-1.png',
                ),
              ),
              Positioned(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 4.0,
                  ),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xff0B251C),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "00 : 04 : 20",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
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

class Navigation extends StatelessWidget {
  const Navigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 8.0,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    spacing: 8.0,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.search,
                        color: Color(0xff939393),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: Color(0xff939393),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey[300],
        ),
      ],
    );
  }
}
