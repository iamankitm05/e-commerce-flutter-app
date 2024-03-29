import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_slide_indicator_state.dart';

class ProductSlideIndicatorCubit extends Cubit<ProductSlideIndicatorState> {
  ProductSlideIndicatorCubit() : super(const ProductSlideIndicatorState());

  void setIndex(int index) {
    emit(ProductSlideIndicatorState(index: index));
  }
}
