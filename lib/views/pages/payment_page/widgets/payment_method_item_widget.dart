import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Utils/app_color.dart';
import 'package:e_commerce/controllers/payment_cubit/payment_cubit.dart';
import 'package:e_commerce/models/payment_method_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodItem extends StatelessWidget {
  final PaymentMethodModel? item;
  final VoidCallback? additionOnTap;
  const PaymentMethodItem({super.key, this.item, this.additionOnTap});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<PaymentCubit>(context);
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 8.0),
      child: DecoratedBox(
          decoration: BoxDecoration(
              color: AppColor.white, borderRadius: BorderRadius.circular(16.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              onTap: additionOnTap != null && item == null
                  ? additionOnTap
                  : () {
                      cubit.choosePaymentMethod(item!.id);
                    },
              leading: item == null
                  ? const Icon(Icons.add_circle_outline)
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: CachedNetworkImage(
                        imageUrl: item!.imageUrl,
                      ),
                    ),
              title: Text(
                item == null ? 'Add New Method' : item!.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: item != null
                  ? Text(
                      item!.cardNumber,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColor.grey,
                          ),
                    )
                  : null,
              trailing: item != null
                  ? BlocBuilder<PaymentCubit, PaymentState>(
                      bloc: cubit,
                      buildWhen: (previous, current) =>
                          current is PaymentMethodChosen,
                      builder: (context, state) {
                        return Radio<String>(
                          value: item!.id,
                          groupValue: state is PaymentMethodChosen
                              ? state.choosenMethodId
                              : null,
                          onChanged: (value) {
                            cubit.choosePaymentMethod(value!);
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    )
                  : null,
            ),
          )),
    );
  }
}
