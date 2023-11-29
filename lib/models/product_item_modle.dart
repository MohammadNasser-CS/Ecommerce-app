class ProductItemModel {
  final String id;
  final String name;
  final String imgUrl;
  final String description;
  final String category;
  final bool isFavorite;
  final double price;

  ProductItemModel(
      {required this.id,
      required this.name,
      required this.imgUrl,
      this.description =
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum in diam blandit, vestibulum diam et, facilisis quam. Maecenas at tempor leo. Curabitur id ipsum efficitur, commodo ante at, aliquam diam. Cras tempor nunc vitae consectetur porta. Suspendisse in dui sit amet nunc finibus finibus vitae eu tortor. Nunc viverra vulputate lectus vel ultricies. Donec blandit dolor vitae augue convallis, at rutrum tellus ornare. Praesent lobortis mi eget nulla luctus, hendrerit congue velit ornare. Phasellus vulputate quis mi nec congue. Duis congue magna orci, sed aliquet ante feugiat quis. Donec vehicula gravida massa, vel posuere risus viverra non. Cras sed mi sapien.',
      required this.category,
      this.isFavorite = false,
      required this.price});
}

List<ProductItemModel> dummyItems = [
  ProductItemModel(
    id: '1',
    name: 'T-shirt',
    imgUrl: 'https://i.pinimg.com/originals/62/98/b0/6298b026a65cf80bcf9dce061e9b79c9.png',
    category: 'Clothes',
    price: 10,
  ),
  ProductItemModel(
    id: '2',
    name: 'T-shirt',
    imgUrl: 'https://parspng.com/wp-content/uploads/2022/07/Tshirtpng.parspng.com_.png',
    category: 'Clothes',
    price: 10.5,
  ),
  ProductItemModel(
    id: '3',
    name: 'T-shirt',
    imgUrl: 'https://pics.clipartpng.com/Sky_Blue_T_Shirt_PNG_Clip_Art-3103.png',
    category: 'Clothes',
    price: 15.5,
  ),
  ProductItemModel(
    id: '4',
    name: 'T-shirt',
    imgUrl: 'https://pics.clipartpng.com/Red_T_Shirt_PNG_Clip_Art-3105.png',
    category: 'Clothes',
    price: 13,
  ),
  ProductItemModel(
    id: '5',
    name: 'T-shirt',
    imgUrl: 'https://static.vecteezy.com/system/resources/previews/021/095/976/original/yellow-t-shirt-free-png.png',
    category: 'Clothes',
    price: 3.3,
  ),
  ProductItemModel(
    id: '6',
    name: 'T-shirt',
    imgUrl: 'https://i.pinimg.com/originals/62/98/b0/6298b026a65cf80bcf9dce061e9b79c9.png',
    category: 'Clothes',
    price: 10,
  ),
  ProductItemModel(
    id: '7',
    name: 'T-shirt',
    imgUrl: 'https://parspng.com/wp-content/uploads/2022/07/Tshirtpng.parspng.com_.png',
    category: 'Clothes',
    price: 10.5,
  ),
  ProductItemModel(
    id: '8',
    name: 'T-shirt',
    imgUrl: 'https://pics.clipartpng.com/Sky_Blue_T_Shirt_PNG_Clip_Art-3103.png',
    category: 'Clothes',
    price: 15.5,
  ),
  ProductItemModel(
    id: '9',
    name: 'T-shirt',
    imgUrl: 'https://pics.clipartpng.com/Red_T_Shirt_PNG_Clip_Art-3105.png',
    category: 'Clothes',
    price: 13,
  ),
  ProductItemModel(
    id: '10',
    name: 'T-shirt',
    imgUrl: 'https://static.vecteezy.com/system/resources/previews/021/095/976/original/yellow-t-shirt-free-png.png',
    category: 'Clothes',
    price: 3.3,
  ),
  ProductItemModel(
    id: '11',
    name: 'T-shirt',
    imgUrl: 'https://i.pinimg.com/originals/62/98/b0/6298b026a65cf80bcf9dce061e9b79c9.png',
    category: 'Clothes',
    price: 10,
  ),
  ProductItemModel(
    id: '12',
    name: 'T-shirt',
    imgUrl: 'https://parspng.com/wp-content/uploads/2022/07/Tshirtpng.parspng.com_.png',
    category: 'Clothes',
    price: 10.5,
  ),
  ProductItemModel(
    id: '13',
    name: 'T-shirt',
    imgUrl: 'https://pics.clipartpng.com/Sky_Blue_T_Shirt_PNG_Clip_Art-3103.png',
    category: 'Clothes',
    price: 15.5,
  ),
  ProductItemModel(
    id: '14',
    name: 'T-shirt',
    imgUrl: 'https://pics.clipartpng.com/Red_T_Shirt_PNG_Clip_Art-3105.png',
    category: 'Clothes',
    price: 13,
  ),
  ProductItemModel(
    id: '15',
    name: 'T-shirt',
    imgUrl: 'https://static.vecteezy.com/system/resources/previews/021/095/976/original/yellow-t-shirt-free-png.png',
    category: 'Clothes',
    price: 3.3,
  ),
];
