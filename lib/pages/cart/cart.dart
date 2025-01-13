import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walkway_mobile/helpers/formatter.dart';
import 'package:walkway_mobile/provider/product_provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final products = productProvider.products;
    final cartItems = productProvider.getCartItemsSorted();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          'My Cart',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey[800],
            letterSpacing: -0.3,
          ),
        ),
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
          cartItems.isEmpty
              ? Container(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 220,
                          height: 220,
                          child: Image.asset('assets/empty-cart.png'),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF4A766E),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Add your Wishlist',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ...cartItems.map((product) {
                        return InkWell(
                          onTap: () {
                            // Provider.of<ProductProvider>(context, listen: false)
                            //     .setSelectedProduct(product);
                            // Navigator.pushNamed(context, '/product');
                          },
                          borderRadius: BorderRadius.circular(6),
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 8.0),
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200],
                            ),
                            child: Row(
                              children: [
                                Checkbox(
                                  value:
                                      productProvider.isItemChecked(product.id),
                                  onChanged: (value) {
                                    productProvider
                                        .toggleCartItemCheck(product.id);
                                  },
                                  fillColor: WidgetStateProperty.all(
                                      Color(0xff4E7772)),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    product.images[0].toString(),
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 12.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.fullName,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 4.0),
                                      Text(
                                        Formatter.formatCurrency(product.price),
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
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
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
            child: Column(
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
                          Provider.of<ProductProvider>(context, listen: false)
                              .setSelectedProduct(product);
                          Navigator.pushNamed(context, '/product');
                        },
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2 - 18,
                          padding: EdgeInsets.all(8.0),
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
                                        productProvider.isInWishlist(product.id)
                                            ? Icons.favorite_rounded
                                            : Icons.favorite_outline_rounded,
                                        color: productProvider
                                                .isInWishlist(product.id)
                                            ? Colors.red
                                            : Color(0xff939393),
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 1,
            color: Colors.grey[300],
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              spacing: 12.0,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Order Subtotal",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                        letterSpacing: -0.3,
                      ),
                    ),
                    Text(
                      Formatter.formatCurrency(
                          productProvider.getCheckedItemsTotal()),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                        letterSpacing: -0.1,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff4E7772),
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
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
