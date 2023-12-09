import 'package:flutter/material.dart';

class ProductSizeOptions extends StatelessWidget {
  final String sizeSympol;
  const ProductSizeOptions({super.key,required this.sizeSympol});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.redAccent),
      ),
      child: Text(
        sizeSympol,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
