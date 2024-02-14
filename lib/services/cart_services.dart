import 'package:e_commerce/Utils/api_path.dart';
import 'package:e_commerce/models/cart_item_model.dart';
import 'package:e_commerce/models/location_model.dart';
import 'package:e_commerce/services/auth_services.dart';
import 'package:e_commerce/services/firestore_services.dart';

abstract class CartServices {
  Future<List<CartItemModel>> getCartItems();
  Future<List<LocationModel>> getLocations();
  Future<void> setLocationItem(LocationModel locationModel);
  Future<void> unSetLocationItem(LocationModel locationModel);
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

  @override
  Future<List<LocationModel>> getLocations({bool hasQuery = false}) async {
    final currentUser = await authServices.getUser();
    return await firestore.getCollection(
      path: ApiPath.locations(currentUser!.uid),
      builder: (data, documentId) => LocationModel.fromMap(data, documentId),
      queryBuilder: hasQuery ? (query) => query.where('isSelected', isEqualTo: true) : null,
    );
  }
  
  @override
  Future<void> setLocationItem(LocationModel locationModel) async {
    final currentUser = await authServices.getUser();
    await firestore.setData(
        path: ApiPath.location(currentUser!.uid, locationModel.id),
        data: locationModel.copyWith(isSelected: true).toMap(),
      );
  }
  
  @override
  Future<void> unSetLocationItem(LocationModel locationModel) async {
    final currentUser = await authServices.getUser();
    await firestore.setData(
        path: ApiPath.location(currentUser!.uid, locationModel.id),
        data: locationModel.copyWith(isSelected: false).toMap(),
      );
  }
}
