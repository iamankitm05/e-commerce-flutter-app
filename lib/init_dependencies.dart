import 'package:e_commerce_flutter_app/constants/app_constants.dart';
import 'package:e_commerce_flutter_app/cubit/product_slide_indicator/product_slide_indicator_cubit.dart';
import 'package:e_commerce_flutter_app/cubit/shopping_cart/shopping_cart_cubit.dart';
import 'package:e_commerce_flutter_app/models/cart_items_model.dart';
import 'package:e_commerce_flutter_app/models/product_model.dart';
import 'package:e_commerce_flutter_app/theme/cubit/app_theme_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.I;

void initDependencies() async {
  await _initSharedPreferences();
  _initTheme();
  _initProductDetails();
  _initShoppingCart();
}

Future<void> _initSharedPreferences() async {
  final pref = await SharedPreferences.getInstance();
  getIt.registerSingleton(pref);
}

void _initTheme() {
  getIt.registerLazySingleton(() => AppThemeCubit());
}

void _initProductDetails() {
  getIt.registerLazySingleton(() => ProductSlideIndicatorCubit());
}

void _initShoppingCart() {
  final pref = getIt<SharedPreferences>();
  final cartItemIds = pref.getStringList(AppConstants.cartItemIds.name) ?? [];
  final cartItemQuentities =
      pref.getStringList(AppConstants.cartItemQuentities.name) ?? [];
  final double cartTotalPrice =
      pref.getDouble(AppConstants.cartTotalPrice.name) ?? 0;
  final double cartPayableAmmount =
      pref.getDouble(AppConstants.cartPayableAmmount.name) ?? 0;

  List<CartItemsModel> cartItems = [];

  for (int i = 0; i < cartItemIds.length; i++) {
    final cartItemId = int.tryParse(cartItemIds[i]);
    final cartItemQuentity = int.tryParse(cartItemQuentities[i]);

    if (cartItemId != null && cartItemQuentity != null) {
      final ProductModel product =
          products.firstWhere((product) => product.id == cartItemId);

      final cartItem = CartItemsModel(
        id: cartItemId,
        product: product,
        quentity: cartItemQuentity,
      );

      cartItems.add(cartItem);
    }
  }

  getIt.registerLazySingleton(
    () => ShoppingCartCubit(ShoppingCartState(
      cartItems: cartItems,
      totalPrice: cartTotalPrice,
      totalDiscount: cartTotalPrice - cartPayableAmmount,
      payableAmmount: cartPayableAmmount,
    )),
  );
}
