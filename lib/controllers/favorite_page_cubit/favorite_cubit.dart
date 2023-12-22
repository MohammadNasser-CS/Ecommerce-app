import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/product_item_modle.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  void getFavoriteData() {
    emit(FavoriteLoading());
    Future.delayed(const Duration(seconds: 1), () {
      emit(FavoriteLoaded(
          productItems:
              dummyItems.where((item) => item.isFavorite == true).toList()));
    });
  }

  void changeFavorite(String itemId) {
    final index = dummyItems.indexWhere((item) => item.id == itemId);
    dummyItems[index] = dummyItems[index].copyWith(
      isFavorite: !dummyItems[index].isFavorite,
    );
    emit(
      FavoriteLoaded(
          productItems:
              dummyItems.where((item) => item.isFavorite == true).toList()),
    );
  }
}
