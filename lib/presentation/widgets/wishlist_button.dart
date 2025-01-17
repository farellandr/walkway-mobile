import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:walkway_mobile/utils/provider.dart';

class WishlistButton extends StatelessWidget {
  final String productId;

  const WishlistButton({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productStore = Provider.productStore;

    return Observer(
      builder: (_) => IconButton(
        onPressed: () => productStore.toggleWishlist(productId),
        icon: Icon(
          productStore.isInWishlist(productId)
              ? Icons.favorite_rounded
              : Icons.favorite_outline_rounded,
          color: productStore.isInWishlist(productId) ? Colors.red : null,
        ),
      ),
    );
  }
}

