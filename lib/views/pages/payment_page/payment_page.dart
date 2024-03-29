import 'package:e_commerce/Utils/app_color.dart';
import 'package:e_commerce/Utils/app_routes.dart';
import 'package:e_commerce/controllers/payment_cubit/payment_cubit.dart';
import 'package:e_commerce/models/location_model.dart';
import 'package:e_commerce/models/payment_method_mode.dart';
import 'package:e_commerce/views/pages/payment_page/widgets/location_selected_widget.dart';
import 'package:e_commerce/views/pages/payment_page/widgets/payment_item_widget.dart';
import 'package:e_commerce/views/pages/payment_page/widgets/payment_method_dialog.dart';
import 'package:e_commerce/views/pages/payment_page/widgets/payment_page_headlines.dart';
import 'package:e_commerce/views/pages/payment_page/widgets/selected_payment_method_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<PaymentCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: BlocBuilder<PaymentCubit, PaymentState>(
        bloc: cubit,
        buildWhen: (previous, current) =>
            current is PaymentLoaded ||
            current is PaymentLoading ||
            current is PaymentError,
        builder: (context, state) {
          if (state is PaymentLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is PaymentLoaded) {
            final location = state.location;
            final cartItems = state.cartItems;
            final total = state.total;
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  children: [
                    PaymentHeadLines(
                      title: 'Address',
                      onTap: () async {
                        await Navigator.of(context)
                            .pushNamed(AppRoutes.locationPage);
                        await cubit.getPaymentPageData();
                      },
                    ),
                    const SizedBox(height: 8.0),
                    state.location == null
                        ? InkWell(
                            onTap: () async {
                              await Navigator.of(context)
                                  .pushNamed(AppRoutes.locationPage);
                              await cubit.getPaymentPageData();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColor.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              width: double.infinity,
                              height: 100,
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Center(
                                  child: Text('Add Address'),
                                ),
                              ),
                            ),
                          )
                        : SelectedLocationItem(item: location as LocationModel),
                    const SizedBox(height: 16.0),
                    PaymentHeadLines(
                      title: 'Products',
                      productsNumber: cartItems.length,
                    ),
                    const SizedBox(height: 8.0),
                    ListView.builder(
                      itemCount: cartItems.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return PaymentItems(item: item);
                      },
                    ),
                    const SizedBox(height: 16.0),
                    const PaymentHeadLines(title: 'Paymeny Method'),
                    const SizedBox(height: 8.0),
                    InkWell(
                      onTap: () => showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => BlocProvider.value(
                          value: cubit,
                          child: const PaymentMethodsDialog(),
                        ),
                      ).then((value) => cubit.getPaymentMethod(value)),
                      child: state.paymentMethod == null
                          ? Container(
                              decoration: BoxDecoration(
                                color: AppColor.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              width: double.infinity,
                              height: 100,
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Center(
                                  child: Text('Add Payment Method'),
                                ),
                              ),
                            )
                          : SelectedPaymentMethod(
                              item: state.paymentMethod as PaymentMethodModel),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: AppColor.grey,
                                  ),
                        ),
                        Text(
                          '\$$total',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: AppColor.white),
                        child: const Text('Checkout now!'),
                      ),
                    ),
                    const SizedBox(height: 32.0),
                  ],
                ),
              ),
            );
          } else if (state is PaymentError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
