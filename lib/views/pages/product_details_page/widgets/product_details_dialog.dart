import 'package:e_commerce/Utils/app_color.dart';
import 'package:e_commerce/controllers/product_details_cubit/product_details_cubit.dart';
import 'package:e_commerce/models/cart_item_model.dart';
import 'package:e_commerce/models/product_item_modle.dart';
import 'package:e_commerce/views/widgets/counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';

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
    tempProductItem = widget.productItemModel;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cubit = BlocProvider.of<ProductDetailsCubit>(context);
    return Container(
      height: size.height * 0.45,
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
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  tempProductItem.name,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                  buildWhen: (previous, current) =>
                      current is QuantityCounterLoaded ||
                      current is ProductDetailsLoaded,
                  bloc: cubit,
                  builder: (context, state) {
                    if (state is QuantityCounterLoaded) {
                      return CounterWidget(
                        cubit: cubit,
                        value: state.value,
                        item: tempProductItem,
                      );
                    } else if (state is ProductDetailsLoaded) {
                      return CounterWidget(
                        cubit: cubit,
                        value: state.product.quantity,
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
            BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
              bloc: cubit,
              buildWhen: (previous, current) =>
                  current is SizeSelected || current is ProductDetailsLoaded,
              builder: (context, state) {
                return Row(
                  children: ItemSize.values
                      .map(
                        (size) => Padding(
                          padding: const EdgeInsets.only(top: 6.0, right: 8.0),
                          child: InkWell(
                            onTap: () {
                              cubit.selectSize(size);
                            },
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    state is SizeSelected && state.size == size
                                        ? Theme.of(context).primaryColor
                                        : AppColor.grey2,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  size.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                        color: state is SizeSelected &&
                                                state.size == size
                                            ? AppColor.white
                                            : AppColor.black,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
              },
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
                    ReadMoreText(
                      colorClickableText: Theme.of(context).primaryColor,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      trimLines: 3,
                      trimMode: TrimMode.Line,
                      tempProductItem.description,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
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
                    buildWhen: (previous, current) =>
                        current is QuantityCounterLoaded,
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
                        final int value = state.product.quantity;
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
                BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                  bloc: cubit,
                  buildWhen: (previous, current) =>
                      current is ProductAddedToCart ||
                      current is ProductAddingToCart,
                  builder: (context, state) {
                    if (state is ProductAddingToCart) {
                      return Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                          child: const CircularProgressIndicator.adaptive(),
                        ),
                      );
                    } else if (state is ProductAddedToCart) {
                      return Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                          child: const CircularProgressIndicator.adaptive(),
                        ),
                      );
                    }
                    return Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          if (cubit.selectedSize != null) {
                            cubit.addToCart(tempProductItem.id);
                            Navigator.of(context).pop();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Please select size',
                                ),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                        child: const Text('Add To Cart!'),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
