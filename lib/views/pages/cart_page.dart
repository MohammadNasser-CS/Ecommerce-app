import 'package:e_commerce/controllers/cart_page_cubit/cart_cubit.dart';
import 'package:e_commerce/views/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      bloc: BlocProvider.of<CartCubit>(context),
      buildWhen: (previous, current) => current is! QuantityCounterLoaded,
      builder: (context, state) {
        if (state is CartLoading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator.adaptive()));
        } else if (state is CartLoaded) {
          return ListView.builder(
            itemCount: state.myOrderItems.length,
            itemBuilder: (context, index) {
              return CartItemWidget(cartItem: state.myOrderItems[index]);
            },
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );
        }
      },
    );
  }
}
