import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Utils/app_color.dart';
import 'package:e_commerce/controllers/home_tab_view_cubit/home_cubit.dart';
import 'package:e_commerce/models/product_item_modle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatelessWidget {
  final ProductItemModel productItemModel;
  final dynamic cubit;
  final dynamic secondaryCubit;
  const ProductItem({
    super.key,
    required this.productItemModel,
    required this.cubit,
    required this.secondaryCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 150,
              width: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.grey.shade200,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CachedNetworkImage(
                  imageUrl: productItemModel.imgUrl,
                  fit: BoxFit.contain,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator.adaptive()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            Positioned(
              top: 1.0,
              right: 1.0,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white70,
                ),
                child: IconButton(
                  onPressed: () {
                    cubit.setFavorite(productItemModel.id);
                    secondaryCubit.updateDataFromOtherCubit(productItemModel.id);
                  },
                  icon: Icon(
                    productItemModel.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: AppColor.red,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6.0),
        Text(
          productItemModel.name,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
        ),
        Text(
          productItemModel.category,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Colors.grey,
                fontSize: 12,
              ),
        ),
        Text(
          '\$${productItemModel.price}',
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
        ),
      ],
    );
  }
}
