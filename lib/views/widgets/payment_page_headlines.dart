import 'package:flutter/material.dart';

class PaymentHeadLines extends StatelessWidget {
  final String title;
  final int? productsNumber;
  final VoidCallback? onTap;
  const PaymentHeadLines(
      {super.key, required this.title, this.productsNumber, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            if (productsNumber != null)
              Text(
                '($productsNumber)',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
          ],
        ),
        if (onTap != null)
          TextButton(
            onPressed: onTap,
            child: Text(
              'Edit',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
          )
      ],
    );
  }
}
