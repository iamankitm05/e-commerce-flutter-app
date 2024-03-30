part of 'shopping_cart_cubit.dart';

class ShoppingCartState extends Equatable {
  final List<CartItemsModel> cartItems;
  final double totalDiscount;
  final double totalPrice;
  final double payableAmmount;

  const ShoppingCartState({
    required this.cartItems,
    required this.totalDiscount,
    required this.totalPrice,
    required this.payableAmmount,
  });

  @override
  List<Object> get props => [
        cartItems,
        totalDiscount,
        totalPrice,
        payableAmmount,
      ];
}
