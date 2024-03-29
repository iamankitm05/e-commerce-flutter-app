import 'package:e_commerce_flutter_app/cubit/shopping_cart/shopping_cart_cubit.dart';
import 'package:e_commerce_flutter_app/init_dependencies.dart';
import 'package:e_commerce_flutter_app/cubit/product_slide_indicator/product_slide_indicator_cubit.dart';
import 'package:e_commerce_flutter_app/screens/products_listing_screen.dart';
import 'package:e_commerce_flutter_app/theme/app_theme.dart';
import 'package:e_commerce_flutter_app/theme/cubit/app_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => getIt<AppThemeCubit>()),
      BlocProvider(create: (context) => getIt<ProductSlideIndicatorCubit>()),
      BlocProvider(create: (context) => getIt<ShoppingCartCubit>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E-Commerce App',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode:
              state.isLightThemeActive ? ThemeMode.light : ThemeMode.dark,
          home: const ProductsListingScreen(),
        );
      },
    );
  }
}
