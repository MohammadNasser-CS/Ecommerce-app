part of 'cart_cubit.dart';

@immutable
sealed class CartState {
  const CartState();
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class QuantityCounterLoaded extends CartState {
  final int value;
  final String itemId;

  const QuantityCounterLoaded({
    required this.value,
    required this.itemId,
  });
}

final class CartLoaded extends CartState {
  final List<MyCartItemModel> myOrderItems;
  const CartLoaded({required this.myOrderItems});
}

final class CartError extends CartState {
  final String message;
  const CartError({
    required this.message,
  });
}
