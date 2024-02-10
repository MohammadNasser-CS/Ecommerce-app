import 'package:e_commerce/Utils/api_path.dart';
import 'package:e_commerce/models/cart_item_model.dart';
import 'package:e_commerce/services/auth_services.dart';
import 'package:e_commerce/services/firestore_services.dart';

abstract class CartServices {
  Future<List<CartItemModel>> getCartItems();
}

class CartServicesImpl implements CartServices {
  final firestore = FirestoreService.instance;
  final authServices = AppAuthImplementation();

  @override
  Future<List<CartItemModel>> getCartItems() async {
    final currentUser = await authServices.getUser();
    return await firestore.getCollection(
      path: ApiPath.getCartItems(currentUser!.uid),
      builder: (data, documentId) => CartItemModel.fromMap(data, documentId),
    );
  }
}
