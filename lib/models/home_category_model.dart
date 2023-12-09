class HomeCategoryModel {
  final String category;
  final String imgUrl;
  final int productsNumber;

  HomeCategoryModel({
    required this.category,
    required this.imgUrl,
    required this.productsNumber,
  });
}

List<HomeCategoryModel> dummyCategories = [
  HomeCategoryModel(
    category: 'Clothes',
    imgUrl:
        'https://images.squarespace-cdn.com/content/v1/5b648c6b7106998053635173/1569423500150-LN2OHZHDSCHMAN5ZNNVP/Copy-of-Copy-of-Copy-of-Copy-of-Untitled-Design-%284%29_Copy-of-Copy-of-Untitle_mockup_Back_Mens_Ocean-Blue.png?format=1000w',
    productsNumber: 358,
  ),
  HomeCategoryModel(
      category: 'Shoese',
      imgUrl:
          'https://i.pinimg.com/originals/51/2b/4b/512b4b870390fac58da5206e88d228d6.png',
      productsNumber: 230),
  HomeCategoryModel(
      category: 'Bags',
      imgUrl:
          'https://freepngimg.com/download/accessories/144659-bag-ladies-red-free-download-image.png',
      productsNumber: 160),
  HomeCategoryModel(
      category: 'Electronics ',
      imgUrl:
          'https://freepngimg.com/thumb/headphones/8-2-headphones-transparent-thumb.png',
      productsNumber: 113),
  HomeCategoryModel(
      category: 'Figures ',
      imgUrl:
          'https://www.fangamer.com/cdn/shop/files/product_UT_papyrus_nendoroid_itemview_new_360x360.png?v=1691698217',
      productsNumber: 153),
];
