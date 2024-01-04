import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Utils/app_color.dart';
import 'package:e_commerce/models/my_cart_item_model.dart';
import 'package:flutter/material.dart';

class PaymentItems extends StatelessWidget {
  final MyCartItemModel item;
  const PaymentItems({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: AppColor.grey.withOpacity(0.4),
            ),
            child: CachedNetworkImage(
              imageUrl: item.imgUrl,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator.adaptive()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (item.size != null)
                      Text.rich(
                        TextSpan(
                          text: 'Size: ',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: AppColor.grey),
                          children: [
                            TextSpan(
                                text: item.size!.name,
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    if (item.size == null) const SizedBox.shrink(),
                    Text(
                      '\$${item.price}',
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
