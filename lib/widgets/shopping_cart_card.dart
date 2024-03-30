import 'package:e_commerce_flutter_app/cubit/shopping_cart/shopping_cart_cubit.dart';
import 'package:e_commerce_flutter_app/models/cart_items_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCartCard extends StatelessWidget {
  final CartItemsModel cartItem;

  const ShoppingCartCard({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    final product = cartItem.product;
    final quentity = cartItem.quentity;
    final totalOldPrice = product.oldPrice * quentity;
    final totalNewPrice = product.newPrice * quentity;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 12,
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Image.network(
                      product.images[0],
                      width: 80,
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      width: 68,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              context
                                  .read<ShoppingCartCubit>()
                                  .addProduct(product);
                            },
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 18,
                              ),
                            ),
                          ),
                          Text(quentity.toString()),
                          InkWell(
                            onTap: () {
                              context
                                  .read<ShoppingCartCubit>()
                                  .decreaseProductQuentity(product);
                            },
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.remove,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "₹$totalNewPrice",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "₹$totalOldPrice",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                          children: [
                            TextSpan(
                              text: '  ${product.discount}% off',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.green,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 0),
          SizedBox(
            height: 45,
            child: Row(
              children: [
                Flexible(
                  child: InkWell(
                    onTap: () {
                      context.read<ShoppingCartCubit>().removeProduct(product);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete_forever_outlined),
                        SizedBox(width: 8),
                        Text('Remove'),
                      ],
                    ),
                  ),
                ),
                const VerticalDivider(),
                const Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.save_alt_outlined),
                      SizedBox(width: 8),
                      Text(
                        'Save for later',
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 0),
        ],
      ),
    );
  }
}
