import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:e_commerce/Utils/app_color.dart';
import 'package:e_commerce/Utils/app_routes.dart';
import 'package:e_commerce/controllers/cart_page_cubit/cart_cubit.dart';
import 'package:e_commerce/views/pages/cart_page/widgets/cart_item_widget.dart';
import 'package:e_commerce/views/pages/cart_page/widgets/cart_page_dialog.dart';
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
          return const Scaffold(
              body: Center(child: CircularProgressIndicator.adaptive()));
        } else if (state is CartLoaded) {
          return SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.myOrderItems.length,
                    itemBuilder: (context, index) {
                      return CartItemWidget(
                          cartItem: state.myOrderItems[index]);
                    },
                  ),
                  const SizedBox(height: 24.0),
                  CartPageDialog(title: 'Subtotal', value: state.subTotal),
                  const SizedBox(height: 12.0),
                  const CartPageDialog(title: 'Shopping', value: 10),
                  const SizedBox(height: 12.0),
                  const DottedDashedLine(
                      height: 0, width: double.infinity, axis: Axis.horizontal),
                  const SizedBox(height: 12.0),
                  CartPageDialog(
                      title: 'Total Amount', value: state.subTotal + 10),
                  const SizedBox(height: 32.0),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context,rootNavigator: true).pushNamed(AppRoutes.paymentPage);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: AppColor.white),
                      child: const Text('Check out'),
                    ),
                  ),
                  const SizedBox(height: 32.0),
                ],
              ),
            ),
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
