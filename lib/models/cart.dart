class CartItem {
  final String productId;
  final String sizeId;
  int quantity;
  final DateTime addedAt;

  CartItem({
    required this.productId,
    required this.sizeId,
    required this.quantity,
    required this.addedAt,
  });
}
