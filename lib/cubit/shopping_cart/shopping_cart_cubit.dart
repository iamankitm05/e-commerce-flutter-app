import 'package:e_commerce_flutter_app/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_flutter_app/models/cart_items_model.dart';
import 'package:equatable/equatable.dart';

part 'shopping_cart_state.dart';

class ShoppingCartCubit extends Cubit<ShoppingCartState> {
  ShoppingCartCubit()
      : super(const ShoppingCartState(
          cartItems: [],
          totalPrice: 0,
          totalDiscount: 0,
          payableAmmount: 0,
        ));

  void addProduct(final ProductModel product) {
  }

  void removeProduct(final ProductModel product) {}
}
