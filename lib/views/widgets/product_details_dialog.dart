import 'package:e_commerce/models/product_item_modle.dart';
import 'package:e_commerce/views/widgets/product_size_options.dart';
import 'package:flutter/material.dart';

class ProductDetailsDialog extends StatefulWidget {
  final ProductItemModel productItemModel;
  const ProductDetailsDialog({super.key, required this.productItemModel});

  @override
  State<ProductDetailsDialog> createState() => _ProductDetailsDialogState();
}

class _ProductDetailsDialogState extends State<ProductDetailsDialog> {
  late ProductItemModel tempProductItem;
  int _quantity = 1;
  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
  }

  @override
  void initState() {
    super.initState();
    tempProductItem = widget.productItemModel;
  }

  void _decreaseQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.topLeft,
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  tempProductItem.name,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const Spacer(),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: _quantity > 1
                            ? () {
                                setState(
                                  () {
                                    _decreaseQuantity();
                                  },
                                );
                              }
                            : null,
                        icon: const Icon(
                          Icons.remove,
                          size: 24.0,
                        ),
                      ),
                      Text(
                        _quantity.toString(),
                        style: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.black87,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(
                            () {
                              _increaseQuantity();
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 24.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Text(
              'Sizes',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const Row(
              children: [
                ProductSizeOptions(sizeSympol: 'S'),
                SizedBox(width: 3.0),
                ProductSizeOptions(sizeSympol: 'M'),
                SizedBox(width: 3.0),
                ProductSizeOptions(sizeSympol: 'L'),
                SizedBox(width: 3.0),
                ProductSizeOptions(sizeSympol: 'XL'),
                SizedBox(width: 3.0),
              ],
            ),
            const SizedBox(height: 12.0),
            Text(
              'Description',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8.0),
                    Text(tempProductItem.description),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    '\$${(tempProductItem.price * _quantity).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 24.0,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                    child: const Text('Add To Cart!'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
