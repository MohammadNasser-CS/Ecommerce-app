import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Utils/app_color.dart';
import 'package:e_commerce/models/address_choose_item_model.dart';
import 'package:flutter/material.dart';

class LocationItem extends StatelessWidget {
  final AddressChooseItemModel item;
  const LocationItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
              color: item.isSelected
                  ? AppColor.red
                  : AppColor.grey.withOpacity(0.3),
              width: 2.5),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          children: [
            const SizedBox(width: 8.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.country,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.description,
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: AppColor.grey,
                                  ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 35,
                child: CachedNetworkImage(
                  imageUrl: item.imgUrl,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator.adaptive()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
