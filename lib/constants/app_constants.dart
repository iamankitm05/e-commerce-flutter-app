enum AppConstants {
  cartItemIds(
    name: 'cart_item_id',
  ),
  cartItemQuentities(
    name: 'cart_item_quentities',
  ),
  cartTotalPrice(
    name: 'cart_total_price',
  ),
  cartPayableAmmount(
    name: 'cart_payable_ammount',
  );

  final String name;

  const AppConstants({required this.name});
}
