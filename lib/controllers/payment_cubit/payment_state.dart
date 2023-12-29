part of 'payment_cubit.dart';

sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}
final class PaymentLoading extends PaymentState {}
final class PaymentLoaded extends PaymentState {
  final List<MyCartItemModel> myOrderItems;
  final AddressChooseItemModel? location;
  final double total;
  PaymentLoaded({required this.myOrderItems,required this.total, this.location});
}
final class PaymentError extends PaymentState {}
