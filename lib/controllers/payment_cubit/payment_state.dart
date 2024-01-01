part of 'payment_cubit.dart';

sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}
final class PaymentLoading extends PaymentState {}
final class PaymentLoaded extends PaymentState {
  final List<MyCartItemModel> myOrderItems;
  final AddressChooseItemModel? location;
  final PaymentMethodModel? paymentMethod;
  final double total;
  PaymentLoaded({required this.myOrderItems,required this.total, this.location,this.paymentMethod});
}
final class PaymentError extends PaymentState {}
final class PaymentMethodChosen extends PaymentState {
  final String choosenMethodId;

  PaymentMethodChosen({required this.choosenMethodId});
}