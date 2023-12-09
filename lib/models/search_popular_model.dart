class SearchPopulerModel {
  final String searchTitle;
  final String imgUrl;
  final String searchNumber;
  final String trendType;
  SearchPopulerModel({
    required this.searchTitle,
    required this.imgUrl,
    required this.searchNumber,
    required this.trendType,
  });
}
List<SearchPopulerModel> dummySearch=[
  SearchPopulerModel(searchTitle: 'Lunilo Hils Jacket', imgUrl: 'https://hillswear.com/userdata/public/gfx/2426/fur-jacket-brown-site2.jpg', searchNumber: '1.6k', trendType: 'Hot'),
  SearchPopulerModel(searchTitle: 'Denim Jeans', imgUrl: 'https://www.prosperity-textile.com/wp-content/uploads/2018/04/D-Light-Denim-Prosperity.jpg', searchNumber: '1k', trendType: 'New'),
  SearchPopulerModel(searchTitle: 'Redil Backpack', imgUrl: 'https://ih1.redbubble.net/image.5292249897.2336/ur,backpack_front,square,600x600.jpg', searchNumber: '1.23k', trendType: 'Popular'),
  SearchPopulerModel(searchTitle: 'JBL Speakers', imgUrl: 'https://i5.walmartimages.com/seo/JBL-Flip-5-Portable-Waterproof-Wireless-Bluetooth-Speaker-Ocean-Blue_f48dd24a-724f-4a78-87e0-7ecbd4fa7806.99004274391e08fa1b66610a5623a476.jpeg', searchNumber: '1.1k', trendType: 'New'),
];