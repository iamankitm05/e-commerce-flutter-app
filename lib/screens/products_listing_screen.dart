import 'package:e_commerce_flutter_app/models/product_model.dart';
import 'package:e_commerce_flutter_app/screens/product_details_screen.dart';
import 'package:e_commerce_flutter_app/theme/cubit/app_theme_cubit.dart';
import 'package:e_commerce_flutter_app/widgets/custom_appbar.dart';
import 'package:e_commerce_flutter_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsListingScreen extends StatelessWidget {
  const ProductsListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        text: 'Products',
      ),
      body: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          final Color foregroundColor =
              state.isLightThemeActive ? Colors.black : Colors.white;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(
                product: products[index],
                foregroundColor: foregroundColor,
                onTap: () {
                  ProductDetailsScreen.navigate(
                    context: context,
                    product: products[index],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
