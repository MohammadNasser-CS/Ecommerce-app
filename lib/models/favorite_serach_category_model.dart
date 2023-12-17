class FavoriteSearchCategoryModel {
  final String favoriteCategory;

  FavoriteSearchCategoryModel({
    required this.favoriteCategory,
  });
}
List <FavoriteSearchCategoryModel> favoriteSearchCategory=[
  FavoriteSearchCategoryModel(favoriteCategory: 'All'),
  FavoriteSearchCategoryModel(favoriteCategory: 'Latest'),
  FavoriteSearchCategoryModel(favoriteCategory: 'Most Populer'),
  FavoriteSearchCategoryModel(favoriteCategory: 'Cheapest'),
  FavoriteSearchCategoryModel(favoriteCategory: 'the Most Expensive'),
];