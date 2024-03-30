import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_flutter_app/cubit/shopping_cart/shopping_cart_cubit.dart';
import 'package:e_commerce_flutter_app/models/product_model.dart';
import 'package:e_commerce_flutter_app/cubit/product_slide_indicator/product_slide_indicator_cubit.dart';
import 'package:e_commerce_flutter_app/screens/shopping_cart_screen.dart';
import 'package:e_commerce_flutter_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;

  static void navigate({
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 350,
                    initialPage:
                        context.read<ProductSlideIndicatorCubit>().state.index,
                  ),
                  itemCount: product.images.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    context.read<ProductSlideIndicatorCubit>().setIndex(index);
                    return Image.network(
                      product.images[index],
                    );
                  },
                ),
                const Positioned(
                  top: 25,
                  right: 25,
                  child: Icon(
                    Icons.favorite_outline,
                    size: 27,
                  ),
                ),
                const Positioned(
                  top: 75,
                  right: 25,
                  child: Icon(
                    Icons.share_outlined,
                    size: 27,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: BlocBuilder<ProductSlideIndicatorCubit,
                  ProductSlideIndicatorState>(
                builder: (context, state) {
                  return SmoothIndicator(
                    offset: state.index.toDouble(),
                    count: product.images.length,
                    size: const Size(50, 4),
                    effect: const ExpandingDotsEffect(
                      dotWidth: 6,
                      dotHeight: 6,
                      spacing: 4,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "₹${product.newPrice}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
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
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.green,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<ShoppingCartCubit>().addProduct(product);
                        },
                        style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.blueGrey),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          minimumSize: const Size(50, 50),
                        ),
                        icon: const Icon(Icons.add_shopping_cart_outlined),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          context.read<ShoppingCartCubit>().addProduct(product);
                          ShoppingCartScreen.navigate(context: context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          minimumSize: const Size(120, 50),
                        ),
                        child: const Text('Buy now'),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: product.details.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(
                          Icons.star_border,
                          size: 22,
                        ),
                        title: Text(product.details[index]),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    product.description,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
