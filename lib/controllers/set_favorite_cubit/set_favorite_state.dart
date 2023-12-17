part of 'set_favorite_cubit.dart';

@immutable
sealed class SetFavoriteState {
  const SetFavoriteState();
}

final class SetFavoriteInitial extends SetFavoriteState {}
// final class FavroiteChangeLoaded extends SetFavoriteState {
//  final List<ProductItemModel> products;

//   const FavroiteChangeLoaded({
//     required this.products,
//   });
// }