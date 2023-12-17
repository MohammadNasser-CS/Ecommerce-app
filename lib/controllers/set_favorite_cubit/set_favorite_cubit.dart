import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/product_item_modle.dart';
import 'package:meta/meta.dart';

part 'set_favorite_state.dart';

class SetFavoriteCubit extends Cubit<SetFavoriteState> {
  SetFavoriteCubit() : super(SetFavoriteInitial());
  //  void setFavorite(String itemId) {
  //   final index = dummyItems.indexWhere((item) => item.id == itemId);
  //   dummyItems[index] = dummyItems[index].copyWith(
  //     isFavorite: !dummyItems[index].isFavorite,
  //   );
  //   emit(
  //     FavroiteChangeLoaded(products: dummyItems),
  //   );
  // }
}
