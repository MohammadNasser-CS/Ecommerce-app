import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/models/cart_item_model.dart';
import 'package:e_commerce/models/product_item_modle.dart';
import 'package:e_commerce/services/product_details_services.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());
  ItemSize? selectedSize;
  int quantity = 1;
  final productDetailsServices = ProductDetailsServicesImpl();

  Future<void> getProductDetails(String id) async {
    emit(ProductDetailsLoading());
    final selectedProduct = await productDetailsServices.getProductDetails(id);
    emit(ProductDetailsLoaded(product: selectedProduct));
  }

  void selectSize(ItemSize size) {
    selectedSize = size;
    emit(SizeSelected(size: size));
  }

  Future<void> addToCart(String productId) async {
    emit(ProductAddingToCart());
    try {
      final selectedProduct =
          await productDetailsServices.getProductDetails(productId);
      final cartItem = CartItemModel(
        id: selectedProduct.id,
        product: selectedProduct,
        size: selectedSize!,
        quantity: quantity,
      );
      await productDetailsServices.addToCart(cartItem);
      emit(
        ProductAddedToCart(productId: productId),
      );
    } catch (e) {
      emit(
        ProductDetailsError(message: e.toString()),
      );
    }
  }

  void increment(String productId) {
    quantity++;
    emit(QuantityCounterLoaded(value: quantity));
  }

  void decrement(String productId) {
    quantity--;
    emit(QuantityCounterLoaded(value: quantity));
  }

  void changeFavorite(String itemId) {
    final index = dummyItems.indexWhere((item) => item.id == itemId);
    dummyItems[index] = dummyItems[index].copyWith(
      isFavorite: !dummyItems[index].isFavorite,
    );
    emit(
      ProductDetailsLoaded(product: dummyItems[index]),
    );
  }
}
