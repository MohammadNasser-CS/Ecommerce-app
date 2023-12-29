import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/models/my_cart_item_model.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  void getCartItems() {
    emit(CartLoading());

    final double subTotal = dummyorders.fold(0, (sum, item) => sum+(item.price*item.quantity));
    Future.delayed(const Duration(seconds: 1), () {
      emit(CartLoaded(myOrderItems: dummyorders,subTotal: subTotal));
    });
  }

  void increment(String cartItemId) {
    final index = dummyorders.indexWhere((item) => item.id == cartItemId);
    dummyorders[index] = dummyorders[index].copyWith(
      quantity: dummyorders[index].quantity + 1,
    );
    emit(
      QuantityCounterLoaded(
          value: dummyorders[index].quantity, itemId: cartItemId),
    );
  }

  void decrement(String cartItemId) {
    final index = dummyorders.indexWhere((item) => item.id == cartItemId);
    dummyorders[index] = dummyorders[index].copyWith(
      quantity:
          dummyorders[index].quantity > 0 ? dummyorders[index].quantity - 1 : 0,
    );
    emit(
      QuantityCounterLoaded(
          value: dummyorders[index].quantity, itemId: cartItemId),
    );
  }
}
