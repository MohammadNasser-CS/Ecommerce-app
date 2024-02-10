import 'package:e_commerce/Utils/api_path.dart';
import 'package:e_commerce/models/cart_item_model.dart';
import 'package:e_commerce/models/product_item_modle.dart';
import 'package:e_commerce/services/auth_services.dart';
import 'package:e_commerce/services/firestore_services.dart';

abstract class ProductDetailsServices {
  Future<ProductItemModel> getProductDetails(String id);
  Future<void> addToCart(CartItemModel addToCartModel);
}

class ProductDetailsServicesImpl implements ProductDetailsServices {
  final firestore = FirestoreService.instance;
  final authServices = AppAuthImplementation();

  @override
  Future<ProductItemModel> getProductDetails(String id) async =>
      await firestore.getDocument<ProductItemModel>(
        path: ApiPath.product(id),
        builder: (data, documentId) =>
            ProductItemModel.fromMap(data, documentId),
      );

  @override
  Future<void> addToCart(CartItemModel addToCartModel) async {
    final currentUser = await authServices.getUser();
    await firestore.setData(
      path: ApiPath.addToCart(
        currentUser!.uid,
        addToCartModel.id,
      ),
      data: addToCartModel.toMap(),
    );
  }
}

