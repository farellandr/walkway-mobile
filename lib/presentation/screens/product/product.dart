import 'package:flutter/material.dart';
import 'package:walkway_mobile/domain/models/product.dart';
import 'package:walkway_mobile/presentation/widgets/back_navbar.dart';

class ProductPage extends StatefulWidget {
  final Product? product;
  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Widget _buildContent() {
    if (widget.product == null) {
      return Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("How did you get here?"),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Go back"),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.product!.brand?.name} ${widget.product!.name}",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
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
    );
  }
}
