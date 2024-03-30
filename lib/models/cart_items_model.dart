import 'package:e_commerce_flutter_app/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
class CartItemsModel extends Equatable {
  final int id;
  final ProductModel product;
  final int quentity;

  const CartItemsModel({
    required this.id,
    required this.product,
    required this.quentity,
  });

  @override
  List<Object?> get props => [
        id,
        product,
        quentity,
      ];
}
