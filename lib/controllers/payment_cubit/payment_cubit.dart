import 'package:e_commerce/models/cart_item_model.dart';
import 'package:e_commerce/services/cart_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/models/location_model.dart';
import 'package:e_commerce/models/payment_method_mode.dart';
import 'package:e_commerce/models/product_item_modle.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  final cartServices = CartServicesImpl();
  Future<void> getPaymentPageData() async {
    emit(PaymentLoading());
    try {
      final cartItems = await cartServices.getCartItems();
      final subTotal = cartItems.fold<double>(
          0, (sum, item) => sum + (item.product.price * item.quantity));
      final selectedLocation =
          (await cartServices.getLocations(hasQuery: true)).isNotEmpty
              ? (await cartServices.getLocations(hasQuery: true)).first
              : null;
      emit(PaymentLoaded(
        cartItems: cartItems,
        total: subTotal + 10,
        location: selectedLocation,
      ));
    } catch (e) {
      emit(
        PaymentError(message: e.toString()),
      );
    }
  }

  // void getLocation(LocationModel item) {
  //   final double subTotal = dummyorders.fold(
  //       0, (sum, item) => sum + (item.product.price * item.quantity));
  //   emit(PaymentLoaded(
  //       cartItems: dummyorders, total: subTotal + 10, location: item));
  // }

  void getPaymentMethod(String itemId) {
    final index = dummyAddresses.indexWhere((item) => item.id == itemId);
    final double subTotal =
        dummyItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
    emit(PaymentLoaded(
        cartItems: dummyorders,
        total: subTotal + 10,
        paymentMethod: savedCards[index]));
  }

  void choosePaymentMethod(String itemId) {
    emit(PaymentMethodChosen(choosenMethodId: itemId));
  }
}
