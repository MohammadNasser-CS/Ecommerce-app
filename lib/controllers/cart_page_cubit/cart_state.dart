part of 'cart_cubit.dart';

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
  final List<CartItemModel> cartItems;
  final double subtotal;
  const CartLoaded({required this.cartItems, required this.subtotal});
}

final class CartError extends CartState {
  final String message;
  const CartError({
    required this.message,
  });
}
