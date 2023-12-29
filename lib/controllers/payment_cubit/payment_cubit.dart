import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/address_choose_item_model.dart';
import 'package:e_commerce/models/my_cart_item_model.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  void getPaymentData() {
    emit(PaymentLoading());
    final double subTotal =
        dummyorders.fold(0, (sum, item) => sum + (item.price * item.quantity));
    Future.delayed(const Duration(seconds: 1), () {
      emit(PaymentLoaded(myOrderItems: dummyorders, total: subTotal + 10));
    });
  }
  void getLocation(AddressChooseItemModel item){
    final double subTotal =
        dummyorders.fold(0, (sum, item) => sum + (item.price * item.quantity));
    emit(PaymentLoaded(myOrderItems: dummyorders, total: subTotal + 10,location: item));
  }
}
