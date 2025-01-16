import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchNavbar extends StatelessWidget implements PreferredSizeWidget {
  final bool isButton;

  const SearchNavbar({super.key, required this.isButton});

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
              spacing: 8.0,
              children: [
                if (!isButton)
                  IconButton(
                    icon: const Icon(Icons.west),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (!isButton) return;
                      Navigator.pushNamed(context, '/search');
                    },
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
                              enabled: !isButton,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                if (isButton)
                  IconButton(
                    icon: const Icon(Icons.shopping_bag_outlined),
                    onPressed: () {})
              ],
            ),
          ),
          Container(
            height: 2.0,
            color: Colors.grey[300],
          )
        ],
      ),
    );
  }
}

