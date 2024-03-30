import 'package:e_commerce_flutter_app/constants/app_constants.dart';
import 'package:e_commerce_flutter_app/init_dependencies.dart';
import 'package:e_commerce_flutter_app/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_flutter_app/models/cart_items_model.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shopping_cart_state.dart';

class ShoppingCartCubit extends Cubit<ShoppingCartState> {
  ShoppingCartCubit(super.initialState);

  void addProduct(final ProductModel product) {
    final List<CartItemsModel> cartItems = [];
    bool isProductAdded = false;
    final double totalPrice = state.totalPrice + product.oldPrice;
    final double payableAmmount = state.payableAmmount + product.newPrice;
    final double totalDiscount = totalPrice - payableAmmount;

    for (final cartItem in state.cartItems) {
      if (cartItem.product == product) {
        isProductAdded = true;
        final updatedCartItem = CartItemsModel(
          id: product.id,
          product: product,
          quentity: cartItem.quentity + 1,
        );
        cartItems.add(updatedCartItem);
      } else {
        cartItems.add(cartItem);
      }
    }

    if (!isProductAdded) {
      final newCartItem = CartItemsModel(
        id: product.id,
        product: product,
        quentity: 1,
      );
      cartItems.add(newCartItem);
    }

    getIt<SharedPreferences>().setStringList(
      AppConstants.cartItemIds.name,
      cartItems.map((cartItem) => cartItem.id.toString()).toList(),
    );
    getIt<SharedPreferences>().setStringList(
      AppConstants.cartItemQuentities.name,
      cartItems.map((cartItem) => cartItem.quentity.toString()).toList(),
    );
    getIt<SharedPreferences>().setDouble(
      AppConstants.cartTotalPrice.name,
      totalPrice,
    );
    getIt<SharedPreferences>().setDouble(
      AppConstants.cartPayableAmmount.name,
      payableAmmount,
    );

    emit(
      ShoppingCartState(
        cartItems: cartItems,
        totalDiscount: totalDiscount,
        totalPrice: totalPrice,
        payableAmmount: payableAmmount,
      ),
    );
  }

  void decreaseProductQuentity(final ProductModel product) {
    final List<CartItemsModel> cartItems = [];
    bool isProductRemoved = false;

    for (final cartItem in state.cartItems) {
      if (cartItem.product == product) {
        isProductRemoved = true;
        if (cartItem.quentity > 1) {
          final updatedCartItem = CartItemsModel(
            id: product.id,
            product: product,
            quentity: cartItem.quentity - 1,
          );
          cartItems.add(updatedCartItem);
        }
      } else {
        cartItems.add(cartItem);
      }
    }

    if (isProductRemoved) {
      double totalPrice = state.totalPrice + product.oldPrice;
      double payableAmmount = state.payableAmmount + product.newPrice;
      double totalDiscount = totalPrice - payableAmmount;

      getIt<SharedPreferences>().setStringList(
        AppConstants.cartItemIds.name,
        cartItems.map((cartItem) => cartItem.id.toString()).toList(),
      );
      getIt<SharedPreferences>().setStringList(
        AppConstants.cartItemQuentities.name,
        cartItems.map((cartItem) => cartItem.quentity.toString()).toList(),
      );
      getIt<SharedPreferences>().setDouble(
        AppConstants.cartTotalPrice.name,
        totalPrice,
      );
      getIt<SharedPreferences>().setDouble(
        AppConstants.cartPayableAmmount.name,
        payableAmmount,
      );

      emit(
        ShoppingCartState(
          cartItems: cartItems,
          totalDiscount: totalDiscount,
          totalPrice: totalPrice,
          payableAmmount: payableAmmount,
        ),
      );
    }
  }

  void removeProduct(final ProductModel product) {
    final List<CartItemsModel> cartItems = [];
    bool isProductRemoved = false;
    double totalPrice = state.totalPrice;
    double payableAmmount = state.payableAmmount;
    double totalDiscount = totalPrice - payableAmmount;

    for (final cartItem in state.cartItems) {
      if (cartItem.product == product) {
        isProductRemoved = true;
        totalPrice -= product.oldPrice * cartItem.quentity;
        payableAmmount -= product.newPrice * cartItem.quentity;
        totalDiscount = totalPrice - payableAmmount;
      } else {
        cartItems.add(cartItem);
      }
    }

    if (isProductRemoved) {
      getIt<SharedPreferences>().setStringList(
        AppConstants.cartItemIds.name,
        cartItems.map((cartItem) => cartItem.id.toString()).toList(),
      );
      getIt<SharedPreferences>().setStringList(
        AppConstants.cartItemQuentities.name,
        cartItems.map((cartItem) => cartItem.quentity.toString()).toList(),
      );
      getIt<SharedPreferences>().setDouble(
        AppConstants.cartTotalPrice.name,
        totalPrice,
      );
      getIt<SharedPreferences>().setDouble(
        AppConstants.cartPayableAmmount.name,
        payableAmmount,
      );
      emit(
        ShoppingCartState(
          cartItems: cartItems,
          totalDiscount: totalDiscount,
          totalPrice: totalPrice,
          payableAmmount: payableAmmount,
        ),
      );
    }
  }
}
