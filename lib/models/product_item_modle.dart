
class ProductItemModel {
  final String id;
  final String name;
  final String imgUrl;
  final String description;
  final String category;
  final bool isFavorite;
  final double price;
  final int quantity;

  ProductItemModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    this.description =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum in diam blandit, vestibulum diam et, facilisis quam. Maecenas at tempor leo. Curabitur id ipsum efficitur, commodo ante at, aliquam diam. Cras tempor nunc vitae consectetur porta. Suspendisse in dui sit amet nunc finibus finibus vitae eu tortor. Nunc viverra vulputate lectus vel ultricies. Donec blandit dolor vitae augue convallis, at rutrum tellus ornare. Praesent lobortis mi eget nulla luctus, hendrerit congue velit ornare. Phasellus vulputate quis mi nec congue. Duis congue magna orci, sed aliquet ante feugiat quis. Donec vehicula gravida massa, vel posuere risus viverra non. Cras sed mi sapien.',
    required this.category,
    this.isFavorite = false,
    required this.price,
    this.quantity = 0,
  });

  ProductItemModel copyWith({
    String? id,
    String? name,
    String? imgUrl,
    String? description,
    String? category,
    bool? isFavorite,
    double? price,
    int? quantity,
  }) {
    return ProductItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      description: description ?? this.description,
      category: category ?? this.category,
      isFavorite: isFavorite ?? this.isFavorite,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'imgUrl': imgUrl});
    result.addAll({'description': description});
    result.addAll({'category': category});
    result.addAll({'isFavorite': isFavorite});
    result.addAll({'price': price});
    result.addAll({'quantity': quantity});

    return result;
  }

  factory ProductItemModel.fromMap(
      Map<String, dynamic> map, String documentId) {
    return ProductItemModel(
      id: documentId,
      name: map['name'] ?? '',
      imgUrl: map['imgUrl'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      isFavorite: map['isFavorite'] ?? false,
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }
}

List<ProductItemModel> dummyItems = [
  
  ProductItemModel(
    id: 'Cv6qGlC9y6qXqJnoxiLH',
    name: 'T-shirt',
    imgUrl:
        'https://parspng.com/wp-content/uploads/2022/07/Tshirtpng.parspng.com_.png',
    category: 'Clothes',
    price: 10.5,
  ),
  ProductItemModel(
    id: 'RNTUKQnxdPHEJkrSiPWO',
    name: 'T-shirt',
    imgUrl:
        'https://pics.clipartpng.com/Sky_Blue_T_Shirt_PNG_Clip_Art-3103.png',
    category: 'Clothes',
    price: 15.5,
  ),
  ProductItemModel(
    id: 'uNqXIk8ESm9yYLJxogCg',
    name: 'T-shirt',
    imgUrl: 'https://pics.clipartpng.com/Red_T_Shirt_PNG_Clip_Art-3105.png',
    category: 'Clothes',
    price: 13,
  ),
  ProductItemModel(
    id: 'FEqb84FdOEYD25cUjLRW',
    name: 'T-shirt',
    imgUrl:
        'https://static.vecteezy.com/system/resources/previews/021/095/976/original/yellow-t-shirt-free-png.png',
    category: 'Clothes',
    price: 3.3,
  ),
  ProductItemModel(
    id: 'c69YH8H0i6YOTGLHVDYu',
    name: 'T-shirt',
    imgUrl:
        'https://i.pinimg.com/originals/62/98/b0/6298b026a65cf80bcf9dce061e9b79c9.png',
    category: 'Clothes',
    price: 10,
  ),
  ProductItemModel(
    id: 't0anPN2T4H68lT2ucnDj',
    name: 'T-shirt',
    imgUrl:
        'https://parspng.com/wp-content/uploads/2022/07/Tshirtpng.parspng.com_.png',
    category: 'Clothes',
    price: 10.5,
  ),
  ProductItemModel(
    id: 'SctXkviKLgoDzHEhb3dZ',
    name: 'T-shirt',
    imgUrl:
        'https://pics.clipartpng.com/Sky_Blue_T_Shirt_PNG_Clip_Art-3103.png',
    category: 'Clothes',
    price: 15.5,
  ),
  ProductItemModel(
    id: 'y65AKlziWqDgXQmeQEON',
    name: 'T-shirt',
    imgUrl: 'https://pics.clipartpng.com/Red_T_Shirt_PNG_Clip_Art-3105.png',
    category: 'Clothes',
    price: 13,
  ),
  ProductItemModel(
    id: 'IDLbVSeGgK05AMON313o',
    name: 'T-shirt',
    imgUrl:
        'https://static.vecteezy.com/system/resources/previews/021/095/976/original/yellow-t-shirt-free-png.png',
    category: 'Clothes',
    price: 3.3,
  ),
  ProductItemModel(
    id: '23SSeWUPeL4OBvfH5ARH',
    name: 'T-shirt',
    imgUrl:
        'https://i.pinimg.com/originals/62/98/b0/6298b026a65cf80bcf9dce061e9b79c9.png',
    category: 'Clothes',
    price: 10,
  ),
  ProductItemModel(
    id: 'CtnSZVQznAVzmJ7yG1gD',
    name: 'T-shirt',
    imgUrl:
        'https://parspng.com/wp-content/uploads/2022/07/Tshirtpng.parspng.com_.png',
    category: 'Clothes',
    price: 10.5,
  ),
  ProductItemModel(
    id: 'mcX5xmU2whMyxQvEGqXY',
    name: 'T-shirt',
    imgUrl:
        'https://pics.clipartpng.com/Sky_Blue_T_Shirt_PNG_Clip_Art-3103.png',
    category: 'Clothes',
    price: 15.5,
  ),
  ProductItemModel(
    id: 'F7mgHye4Xq9GgKZ9gCaF',
    name: 'T-shirt',
    imgUrl: 'https://pics.clipartpng.com/Red_T_Shirt_PNG_Clip_Art-3105.png',
    category: 'Clothes',
    price: 13,
  ),
  ProductItemModel(
    id: 'AoiDW79JODb0ck9f9Lvv',
    name: 'T-shirt',
    imgUrl:
        'https://static.vecteezy.com/system/resources/previews/021/095/976/original/yellow-t-shirt-free-png.png',
    category: 'Clothes',
    price: 3.3,
  ),
];
