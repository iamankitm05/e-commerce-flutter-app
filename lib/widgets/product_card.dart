import 'package:e_commerce_flutter_app/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final Color foregroundColor;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.foregroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 15,
      ),
      shape: Border(
        bottom: BorderSide(color: foregroundColor),
      ),
      leading: product.images.isNotEmpty
          ? Image.network(
              product.images[0],
            )
          : const Icon(
              Icons.image,
              size: 80,
            ),
      title: Text(
        'Mac book air',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: foregroundColor,
            ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "₹${product.newPrice}",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: foregroundColor,
                ),
          ),
          RichText(
            text: TextSpan(
              text: "₹${product.oldPrice}",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
              children: [
                TextSpan(
                  text: '  ${product.discount}% off',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.green,
                      ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product.description,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: foregroundColor,
                ),
          ),
        ],
      ),
    );
  }
}
