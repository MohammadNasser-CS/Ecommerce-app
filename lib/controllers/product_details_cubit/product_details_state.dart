part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {
  const ProductDetailsState();
}

final class ProductDetailsInitial extends ProductDetailsState {}
final class ProductDetailsLoading extends ProductDetailsState {}
final class QuantityCounterLoaded extends ProductDetailsState {
  final int value;
  final String itemId;

  const QuantityCounterLoaded({
    required this.value,
    required this.itemId,
  });
}

final class ProductDetailsLoaded extends ProductDetailsState {
  final List<ProductItemModel> productItems;
  const ProductDetailsLoaded({required this.productItems});
}

final class ProductDetailsError extends ProductDetailsState {
  final String message;
  const ProductDetailsError({
    required this.message,
  });
}
