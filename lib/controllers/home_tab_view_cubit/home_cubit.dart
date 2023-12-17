import 'package:bloc/bloc.dart';
import 'package:e_commerce/controllers/favorite_page_cubit/favorite_cubit.dart';
import 'package:meta/meta.dart';
import 'package:e_commerce/models/home_carousel_model.dart';
import 'package:e_commerce/models/product_item_modle.dart';

part 'home_state.dart';
class HomeCubit extends Cubit<HomeState> {
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
  void setFavorite(String itemId) {
    final index = dummyItems.indexWhere((item) => item.id == itemId);
    dummyItems[index] = dummyItems[index].copyWith(
      isFavorite: !dummyItems[index].isFavorite,
    );
    emit(
      HomePageFavroiteChangeLoaded(
          products: dummyItems),
    );
  }
  void updateDataFromOtherCubit(String itemId) {
    emit(
      HomePageFavroiteChangeLoaded(
          products: dummyItems),
    );
  }
}
