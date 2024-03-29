import 'package:e_commerce_flutter_app/cubit/product_slide_indicator/product_slide_indicator_cubit.dart';
import 'package:e_commerce_flutter_app/cubit/shopping_cart/shopping_cart_cubit.dart';
import 'package:e_commerce_flutter_app/theme/cubit/app_theme_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

void initDependencies() async {
  _initTheme();
  _initProductDetails();
  _initShoppingCart();

}

void _initTheme() {
  getIt.registerLazySingleton(() => AppThemeCubit());
}

void _initProductDetails() {
  getIt.registerLazySingleton(() => ProductSlideIndicatorCubit());
}

void _initShoppingCart() {
  getIt.registerLazySingleton(() => ShoppingCartCubit());
}
