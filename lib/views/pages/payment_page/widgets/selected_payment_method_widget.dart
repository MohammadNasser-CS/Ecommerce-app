import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Utils/app_color.dart';
import 'package:e_commerce/models/payment_method_mode.dart';
import 'package:flutter/material.dart';

class SelectedPaymentMethod extends StatelessWidget {
  final PaymentMethodModel item;
  const SelectedPaymentMethod({super.key,required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 8.0),
      child: DecoratedBox(
          decoration: BoxDecoration(
              color: AppColor.white, borderRadius: BorderRadius.circular(16.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              onTap: () {},
              leading:  ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: CachedNetworkImage(
                        imageUrl: item.imageUrl,
                      ),
                    ),
              title: Text(
                item.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle:Text(
                      item.cardNumber,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColor.grey,
                          ),
                    )
                  ,
            ),
          )),
    );
  }
}