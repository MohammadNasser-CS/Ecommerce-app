import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Utils/app_color.dart';
import 'package:e_commerce/controllers/cart_page_cubit/cart_cubit.dart';
import 'package:e_commerce/models/cart_item_model.dart';
import 'package:e_commerce/views/widgets/counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemModel cartItem;
  const CartItemWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.grey.withOpacity(0.4),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: 150,
                      imageUrl: cartItem.product.imgUrl,
                      placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator.adaptive()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                PositionedDirectional(
                  end: 8,
                  top: 8,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: AppColor.red.withOpacity(0.3),
                        shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete_forever_outlined,
                        color: AppColor.red,
                      ),
                    ),
                  ),
                ),
                PositionedDirectional(
                  start: 8,
                  bottom: 8,
                  child: BlocBuilder<CartCubit, CartState>(
                    buildWhen: (previous, current) =>
                        (current is QuantityCounterLoaded &&
                            current.itemId == cartItem.id) ||
                        current is CartLoaded,
                    bloc: BlocProvider.of<CartCubit>(context),
                    builder: (context, state) {
                      if (state is QuantityCounterLoaded) {
                        return CounterWidget(
                          cubit: BlocProvider.of<CartCubit>(context),
                          value: state.value,
                          item: cartItem,
                        );
                      } else if (state is CartLoaded) {
                        return CounterWidget(
                          cubit: BlocProvider.of<CartCubit>(context),
                          value: state.cartItems
                              .firstWhere((item) => item.id == cartItem.id)
                              .quantity,
                          item: cartItem,
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.product.name,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  if (cartItem.size != null)
                    Text.rich(
                      TextSpan(
                        text: 'Size: ',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: AppColor.grey),
                        children: [
                          TextSpan(
                            text: cartItem.size?.name,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              BlocBuilder<CartCubit, CartState>(
                buildWhen: (previous, current) =>
                    (current is QuantityCounterLoaded &&
                        current.itemId == cartItem.id) ||
                    current is CartLoaded,
                builder: (context, state) {
                  if (state is QuantityCounterLoaded) {
                    return Text(
                      '\$${(cartItem.product.price * state.value).toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    );
                  } else if (state is CartLoaded) {
                    double price = cartItem.product.price;
                    int quantity = state.cartItems
                        .firstWhere(
                          (item) => item.id == cartItem.id,
                        )
                        .quantity;
                    return Text('\$${(price * quantity).toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                            ));
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
