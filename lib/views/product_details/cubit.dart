import 'package:alalmiya_g3/views/product_details/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  ProductDetailsCubit() : super(ProductDetailsStates());

  Future<void> getData() async {
    emit(GetProductDetailsLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(GetProductDetailsSuccessState());
  }
}
