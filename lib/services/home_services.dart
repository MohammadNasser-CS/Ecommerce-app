import 'package:e_commerce/Utils/api_path.dart';
import 'package:e_commerce/models/product_item_modle.dart';
import 'package:e_commerce/services/firestore_services.dart';

abstract class HomeServices {
  Future<List<ProductItemModel>> getProducts();
  Stream<List<ProductItemModel>> getProductsStream();
  Future<void> addProduct(ProductItemModel product);
  Future<void> deleteProduct(String id);
}

class HomeServicesImpl implements HomeServices {
  final firestore = FirestoreService.instance;

  @override
  Future<List<ProductItemModel>> getProducts() async {
    return await firestore.getCollection<ProductItemModel>(
        path: ApiPath.products(),
        builder: (data, documentId) =>
            ProductItemModel.fromMap(data, documentId));
  }

  @override
  Stream<List<ProductItemModel>> getProductsStream() {
    return firestore.collectionStream<ProductItemModel>(
        path: ApiPath.products(),
        builder: (data, documentId) =>
            ProductItemModel.fromMap(data, documentId));
  }

  @override
  Future<void> addProduct(ProductItemModel product) async =>
      await firestore.setData(
        path: ApiPath.product(product.id),
        data: product.toMap(),
      );

  @override
  Future<void> deleteProduct(String id) async =>
      await firestore.deleteData(path: ApiPath.product(id));
}
