import 'package:flutter/material.dart';

class CartPageDialog extends StatelessWidget {
  final String title;
  final double value;
  const CartPageDialog({super.key,required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: Theme.of(context).textTheme.labelLarge,),
          Text('\$$value',style: Theme.of(context).textTheme.labelLarge,),
      ],),
    );
  }
}