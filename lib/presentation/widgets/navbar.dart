import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({super.key});

  EdgeInsets get padding =>
      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight + (padding.vertical));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness:
          Brightness.light, // For iOS: white status bar with dark text/icons
      statusBarIconBrightness: Brightness.dark, // For Android: dark icons
    ));

    return SafeArea(
      child: Column(
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
              spacing: 8.0,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      spacing: 8.0,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey[600],
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
                    icon: const Icon(Icons.shopping_bag_outlined),
                    onPressed: () {})
              ],
            ),
          ),
          Container(
            height: 1.0,
            color: Colors.grey[300],
          )
        ],
      ),
    );
  }
}
