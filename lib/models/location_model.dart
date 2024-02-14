class LocationModel {
  final String id;
  final String country;
  final String imgUrl;
  final String cityName;
  final bool isSelected;

  LocationModel({
    required this.id,
    required this.country,
    required this.imgUrl,
    required this.cityName,
    this.isSelected = false,
  });

  LocationModel copyWith({
    String? id,
    String? country,
    String? imgUrl,
    String? cityName,
    bool? isSelected,
  }) {
    return LocationModel(
      id: id ?? this.id,
      country: country ?? this.country,
      imgUrl: imgUrl ?? this.imgUrl,
      cityName: cityName ?? this.cityName,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'country': country});
    result.addAll({'imgUrl': imgUrl});
    result.addAll({'cityName': cityName});
    result.addAll({'isSelected': isSelected});

    return result;
  }

  factory LocationModel.fromMap(Map<String, dynamic> map, String documentId) {
    return LocationModel(
      id: documentId,
      country: map['country'] ?? '',
      imgUrl: map['imgUrl'] ?? '',
      cityName: map['cityName'] ?? '',
      isSelected: map['isSelected'] ?? false,
    );
  }
}

List<LocationModel> dummyAddresses = [
  LocationModel(
      id: '1',
      country: 'Palestine',
      imgUrl:
          'https://static.vecteezy.com/system/resources/thumbnails/001/265/747/small/blue-pin-in-showing-location-on-white-map.jpg',
      cityName: 'Nablus - Palestine'),
  LocationModel(
      id: '2',
      country: 'Palestine',
      imgUrl:
          'https://static.vecteezy.com/system/resources/thumbnails/001/265/731/small/map-with-location-pin.jpg',
      cityName: 'Ramallah - Palestine'),
  LocationModel(
      id: '3',
      country: 'Palestine',
      imgUrl:
          'https://static.vecteezy.com/system/resources/thumbnails/001/265/747/small/blue-pin-in-showing-location-on-white-map.jpg',
      cityName: 'Tulkarem - Palestine'),
];
