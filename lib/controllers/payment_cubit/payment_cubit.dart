import 'package:e_commerce/models/cart_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/models/address_choose_item_model.dart';
import 'package:e_commerce/models/payment_method_mode.dart';
import 'package:e_commerce/models/product_item_modle.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  void getPaymentData() {
    emit(PaymentLoading());
    final double subTotal =
        dummyorders.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
    Future.delayed(const Duration(seconds: 1), () {
      emit(PaymentLoaded(myOrderItems: dummyorders, total: subTotal + 10));
    });
  }

  void getLocation(AddressChooseItemModel item) {
    final double subTotal =
        dummyorders.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
    emit(PaymentLoaded(
        myOrderItems: dummyorders, total: subTotal + 10, location: item));
  }

  void getPaymentMethod(String itemId) {
    final index = dummyAddresses.indexWhere((item) => item.id == itemId);
    final double subTotal =
        dummyItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
    emit(PaymentLoaded(
        myOrderItems: dummyorders,
        total: subTotal + 10,
        paymentMethod: savedCards[index]));
  }

  void choosePaymentMethod(String itemId) {
    emit(PaymentMethodChosen(choosenMethodId: itemId));
  }
}
