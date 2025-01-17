import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:walkway_mobile/utils/provider.dart';

class BackNavbar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBack;
  final bool showLove;
  final bool showCart;
  final String? title;

  const BackNavbar({
    super.key,
    this.showBack = false,
    this.showLove = false,
    this.showCart = false,
    this.title,
  });

  EdgeInsets get padding =>
      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight + (padding.vertical));
  }

  @override
  Widget build(BuildContext context) {
    final productStore = Provider.productStore;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness:
          Brightness.light, // For iOS: white status bar with dark text/icons
      statusBarIconBrightness: Brightness.dark, // For Android: dark icons
    ));

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: padding.top,
              bottom: padding.bottom,
              left: padding.left,
              right: padding.right,
            ),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    if (showBack)
                      IconButton(
                        icon: const Icon(Icons.west),
                        onPressed: () {
                          productStore.fetchProducts();
                          Navigator.pop(context);
                        },
                      ),
                    if (title != null)
                      Text(
                        title!,
                        style: TextStyle(
                            fontSize: 16,
                            letterSpacing: -0.3,
                            fontWeight: FontWeight.w500),
                      ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (showLove)
                      IconButton(
                          icon: const Icon(Icons.favorite_outline_rounded),
                          onPressed: () {}),
                    if (showCart)
                      IconButton(
                          icon: const Icon(Icons.shopping_bag_outlined),
                          onPressed: () {
                            Navigator.pushNamed(context, '/cart');
                          }),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 2.0,
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
