import 'package:e_commerce/services/cart_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/models/cart_item_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  final cartServices = CartServicesImpl();
  Future<void> getCartItems() async {
    emit(CartLoading());
    try {
      final cartItems = await cartServices.getCartItems();
      ordersCopy = cartItems;
      final subTotal = cartItems.fold<double>(
          0, (sum, item) => sum + (item.product.price * item.quantity));
      emit(CartLoaded(
        cartItems: cartItems,
        subtotal: subTotal,
      ));
    } catch (e) {
      emit(
        CartError(message: e.toString()),
      );
    }
  }

  Future<void> increment(String cartItemId) async {
    final index = ordersCopy.indexWhere((item) => item.id == cartItemId);
    ordersCopy[index] = ordersCopy[index].copyWith(
      quantity: ordersCopy[index].quantity + 1,
    );
    final subTotal = ordersCopy.fold<double>(
        0, (sum, item) => sum + (item.product.price * item.quantity));
    emit(CartLoaded(
      cartItems: ordersCopy,
      subtotal: subTotal,
    ));
    emit(
      QuantityCounterLoaded(
          value: ordersCopy[index].quantity, itemId: cartItemId),
    );
  }

  Future<void> decrement(String cartItemId) async {
    final index = ordersCopy.indexWhere((item) => item.id == cartItemId);
    ordersCopy[index] = ordersCopy[index].copyWith(
      quantity:
          ordersCopy[index].quantity > 0 ? ordersCopy[index].quantity - 1 : 0,
    );
    final subTotal = ordersCopy.fold<double>(
        0, (sum, item) => sum + (item.product.price * item.quantity));
    emit(CartLoaded(
      cartItems: ordersCopy,
      subtotal: subTotal,
    ));
    emit(
      QuantityCounterLoaded(
          value: ordersCopy[index].quantity, itemId: cartItemId),
    );
  }
}
