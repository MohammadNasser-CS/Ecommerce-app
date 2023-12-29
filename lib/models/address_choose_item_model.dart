class AddressChooseItemModel {
  final String id;
  final String country;
  final String imgUrl;
  final String description;
  final bool isSelected;

  AddressChooseItemModel({
    required this.id,
    required this.country,
    required this.imgUrl,
    required this.description,
    this.isSelected=false,
  });
  
  AddressChooseItemModel copyWith({
    String? id,
    String? country,
    String? imgUrl,
    String? description,
    bool? isSelected,
  }) {
    return AddressChooseItemModel(
      id: id ?? this.id,
      country: country ?? this.country,
      imgUrl: imgUrl ?? this.imgUrl,
      description: description ?? this.description,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
List<AddressChooseItemModel> dummyAddresses=[
  AddressChooseItemModel(id: '1',country: 'Nablus', imgUrl: 'https://static.vecteezy.com/system/resources/thumbnails/001/265/747/small/blue-pin-in-showing-location-on-white-map.jpg', description: 'Nablus - Palestine'),
  AddressChooseItemModel(id: '2',country: 'Ramallah', imgUrl: 'https://static.vecteezy.com/system/resources/thumbnails/001/265/731/small/map-with-location-pin.jpg', description: 'Ramallah - Palestine'),
  AddressChooseItemModel(id: '3',country: 'Tulkarem', imgUrl: 'https://static.vecteezy.com/system/resources/thumbnails/001/265/747/small/blue-pin-in-showing-location-on-white-map.jpg', description: 'Tulkarem - Palestine'),
];