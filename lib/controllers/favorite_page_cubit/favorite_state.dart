part of 'favorite_cubit.dart';

sealed class FavoriteState {
  const FavoriteState();
}

final class FavoriteInitial extends FavoriteState {}
final class FavoriteLoading extends FavoriteState {}
final class FavroiteChangeLoaded extends FavoriteState {
final List<ProductItemModel> products;
  const FavroiteChangeLoaded({
    required this.products,
  });
}

final class FavoriteLoaded extends FavoriteState {
  final List<ProductItemModel> productItems;
  const FavoriteLoaded({required this.productItems});
}

final class FavoriteError extends FavoriteState {
  final String message;
  const FavoriteError({
    required this.message,
  });
}