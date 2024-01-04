import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/home_category_model.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final HomeCategoryModel categoryItemModel;
  const CategoryItem({
    super.key,
    required this.categoryItemModel,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.grey.shade200,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedNetworkImage(
                  imageUrl: categoryItemModel.imgUrl,
                  fit: BoxFit.cover,
                  width: 150,
                  height: double.infinity,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator.adaptive()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categoryItemModel.category,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    '${categoryItemModel.productsNumber} Products',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                  )
                ],
              )
            ],
          ),
        ),
        // Positioned(top: 1.0, right: 1.0, child: Column()),
      ],
    );
  }
}
