import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/services/home_services.dart';
import 'package:e_commerce/models/home_carousel_model.dart';
import 'package:e_commerce/models/product_item_modle.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final HomeServices _homeServices = HomeServicesImpl();
  Future<void> getHomeData() async {
    emit(HomeLoading());
    final products = await _homeServices.getProducts();
    emit(
      HomeLoaded(
        products: products,
        carouselItems: dummyCarouselItems,
      ),
    );
    // final products = _homeServices.getProductsStream();
    // products.listen((event) {
    //   emit(
    //     HomeLoaded(
    //       products: event,
    //       carouselItems: dummyCarouselItems,
    //     ),
    //   );
    // });
  }
Future<void> addProduct(ProductItemModel product) async {
    await _homeServices.addProduct(product);
  }

  Future<void> deleteProduct(String id) async {
    await _homeServices.deleteProduct(id);
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
