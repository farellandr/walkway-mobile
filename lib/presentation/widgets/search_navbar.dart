import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchNavbar extends StatefulWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final String? initialQuery;
  final Function(String)? onSearch;
  final Function()? onBack;

  const SearchNavbar({
    super.key, 
    this.showBackButton = false,
    this.initialQuery,
    this.onSearch,
    this.onBack,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 16.0);

  @override
  State<SearchNavbar> createState() => _SearchNavbarState();
}

class _SearchNavbarState extends State<SearchNavbar> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.initialQuery);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  EdgeInsets get padding =>
      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);

  void _handleSearch(String query) {
    if (widget.onSearch != null) {
      widget.onSearch!(query);
    } else {
      Navigator.pushNamed(
        context, 
        '/search',
        arguments: query,
      );
    }
    _searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
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
                if (widget.showBackButton)
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      widget.onBack!();
                      Navigator.pop(context);
                    },
                  ),
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
                            controller: _searchController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search products...',
                            ),
                            onSubmitted: _handleSearch,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_bag_outlined),
                  onPressed: () {
                    Navigator.pushNamed(context, '/cart');
                  }
                )
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

