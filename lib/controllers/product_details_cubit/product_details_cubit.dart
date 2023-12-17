import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/product_item_modle.dart';
import 'package:meta/meta.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());
  void getProductDetails() {
    emit(ProductDetailsLoading());
    Future.delayed(const Duration(seconds: 3), () {
      emit(ProductDetailsLoaded(productItems: dummyItems));
    });
  }

  void increment(String itemId) {
    final index = dummyItems.indexWhere((item) => item.id == itemId);
    dummyItems[index] = dummyItems[index].copyWith(
      quantity: dummyItems[index].quantity + 1,
    );
    emit(
      QuantityCounterLoaded(
          value: dummyItems[index].quantity, itemId: itemId),
    );
  }

  void decrement(String itemId) {
    final index = dummyItems.indexWhere((item) => item.id == itemId);
    dummyItems[index] = dummyItems[index].copyWith(
      quantity:
          dummyItems[index].quantity > 0 ? dummyItems[index].quantity - 1 : 0,
    );
    emit(
      QuantityCounterLoaded(
          value: dummyItems[index].quantity, itemId: itemId),
    );
  }
}
