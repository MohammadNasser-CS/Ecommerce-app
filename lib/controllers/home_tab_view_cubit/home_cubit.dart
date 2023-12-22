import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:e_commerce/models/home_carousel_model.dart';
import 'package:e_commerce/models/product_item_modle.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  
  late final StreamSubscription otherCubitSubscription;
  HomeCubit() : super(HomeInitial());
  
  void getHomeData() {
    emit(HomeLoading());
    Future.delayed(const Duration(seconds: 4), () {
      emit(
        HomeLoaded(
          products: dummyItems,
          carouselItems: dummyCarouselItems,
        ),
      );
    });
  }

  void changeFavorite(String itemId) {
    final index = dummyItems.indexWhere((item) => item.id == itemId);
    dummyItems[index] = dummyItems[index].copyWith(
      isFavorite: !dummyItems[index].isFavorite,
    );
    emit(
        HomeLoaded(
          products: dummyItems,
          carouselItems: dummyCarouselItems,
        ),
      );
    
  }


}
