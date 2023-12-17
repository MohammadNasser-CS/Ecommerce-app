import 'package:bloc/bloc.dart';
import 'package:e_commerce/controllers/home_tab_view_cubit/home_cubit.dart';
import 'package:e_commerce/models/product_item_modle.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  
  FavoriteCubit() : super(FavoriteInitial());
  void getFavoriteData() {
    emit(FavoriteLoading());
    Future.delayed(const Duration(seconds: 3), () {
      emit(FavoriteLoaded(productItems: dummyItems.where((item) => item.isFavorite==true).toList()));
    });
  }

  void setFavorite(String itemId) {
    final index = dummyItems.indexWhere((item) => item.id == itemId);
    dummyItems[index] = dummyItems[index].copyWith(
      isFavorite: !dummyItems[index].isFavorite,
    );
    emit(
      FavroiteChangeLoaded(products: dummyItems.where((item) => item.isFavorite==true).toList()),
    );
    
  }
  void updateDataFromOtherCubit(String itemId) {
    emit(
      FavroiteChangeLoaded(
          products: dummyItems.where((item) => item.isFavorite==true).toList()),
    );
  }
  // void decrement(String cartItemId) {
  //   final index = dummyorders.indexWhere((item) => item.id == cartItemId);
  //   dummyorders[index] = dummyorders[index].copyWith(
  //     quantity:
  //         dummyorders[index].quantity > 0 ? dummyorders[index].quantity - 1 : 0,
  //   );
  //   emit(
  //     QuantityCounterLoaded(
  //         value: dummyorders[index].quantity, itemId: cartItemId),
  //   );
  // }
}
