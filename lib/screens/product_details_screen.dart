import 'package:e_commerce_flutter_app/models/product_model.dart';
import 'package:e_commerce_flutter_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;

  static void goToProductDetailsScreen({
    required BuildContext context,
    required ProductModel product,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsScreen(product: product),
      ),
    );
  }

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        text: 'Product Details',
      ),
      body: Text(product.name),
    );
  }
}
