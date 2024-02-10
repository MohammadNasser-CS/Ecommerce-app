import 'package:e_commerce/models/product_item_modle.dart';
enum ItemSize {
  s,
  m,
  l,
  xl;

  factory ItemSize.fromString(String size) {
    return ItemSize.values.firstWhere((element) => element.name == size);
  }
}

class CartItemModel {
  final String id;
  final ProductItemModel product;
  final ItemSize? size;
  final int quantity;
  CartItemModel({
    required this.id,
    required this.product,
    this.size,
    required this.quantity,
  });

  CartItemModel copyWith({
    String? id,
    ProductItemModel? product,
    ItemSize? size,
    int? quantity,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      product: product ?? this.product,
      size: size ?? this.size,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'id': id});
    result.addAll({'product': product.toMap()});
    if (size != null) {
      result.addAll({'size': size == null ? null : size!.name});
    }
    result.addAll({'quantity': quantity});

    return result;
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map, String documentId) {
    return CartItemModel(
      id: documentId,
      product:
          ProductItemModel.fromMap(map['product'], map['product']['id'] ?? ''),
      size: map['size'] != null ? ItemSize.fromString(map['size']) : null,
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }
}
List<CartItemModel> ordersCopy = [
  
];
List<CartItemModel> dummyorders = [
  CartItemModel(
    id: '1',
    size: ItemSize.l,
    product: dummyItems[0],
    quantity: 2,
  ),
  CartItemModel(
    id: '2',
    quantity: 1,
    size: ItemSize.m,
    product: dummyItems[1],
  ),
  CartItemModel(
    id: '3',
    quantity: 3,
    size: ItemSize.s,
    product: dummyItems[2],
  ),
  CartItemModel(
    id: '4',
    quantity: 6,
    product: dummyItems[3],
  ),
  CartItemModel(
    id: '5',
    quantity: 1,
    size: ItemSize.l,
    product: dummyItems[4],
  ),
];
