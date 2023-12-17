import 'package:e_commerce/controllers/product_details_cubit/product_details_cubit.dart';
import 'package:e_commerce/models/product_item_modle.dart';
import 'package:e_commerce/views/widgets/counter_widget.dart';
import 'package:e_commerce/views/widgets/product_size_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsDialog extends StatefulWidget {
  final ProductItemModel productItemModel;
  const ProductDetailsDialog({super.key, required this.productItemModel});

  @override
  State<ProductDetailsDialog> createState() => _ProductDetailsDialogState();
}

class _ProductDetailsDialogState extends State<ProductDetailsDialog> {
  late ProductItemModel tempProductItem;
  @override
  void initState() {
    super.initState();
    tempProductItem=widget.productItemModel;
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
                BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                  buildWhen: (previous, current) =>
                      (current is QuantityCounterLoaded &&
                          current.itemId == tempProductItem.id) ||
                      current is ProductDetailsLoaded,
                  bloc: BlocProvider.of<ProductDetailsCubit>(context),
                  builder: (context, state) {
                    if (state is QuantityCounterLoaded) {
                      return CounterWidget(
                        cubit: BlocProvider.of<ProductDetailsCubit>(context),
                        value: state.value,
                        item: tempProductItem,
                      );
                    } else if (state is ProductDetailsLoaded) {
                      return CounterWidget(
                        cubit: BlocProvider.of<ProductDetailsCubit>(context),
                        value: state.productItems
                            .firstWhere((item) => item.id == tempProductItem.id)
                            .quantity,
                        item: tempProductItem,
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
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
                  child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                    builder: (context, state) {
                      if (state is QuantityCounterLoaded) {
                        return Text(
                          '\$${(tempProductItem.price * state.value).toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 24.0,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      } else if (state is ProductDetailsLoaded) {
                        final int value = state.productItems
                            .firstWhere((item) => item.id == tempProductItem.id)
                            .quantity;
                        return Text(
                          '\$${(tempProductItem.price * value).toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 24.0,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
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
