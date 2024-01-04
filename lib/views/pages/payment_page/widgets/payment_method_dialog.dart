import 'package:e_commerce/Utils/app_color.dart';
import 'package:e_commerce/Utils/app_routes.dart';
import 'package:e_commerce/controllers/payment_cubit/payment_cubit.dart';
import 'package:e_commerce/models/payment_method_mode.dart';
import 'package:e_commerce/views/pages/payment_page/widgets/payment_method_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodsDialog extends StatelessWidget {
  const PaymentMethodsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cubit=BlocProvider.of<PaymentCubit>(context);
    return BlocBuilder<PaymentCubit, PaymentState>(
      bloc: cubit,
      builder: (context, state) {
        return SizedBox(
          height: size.height * 0.45,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  Text(
                    'Payment Method',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 24.0),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: savedCards.length,
                    itemBuilder: (context, index) {
                      return PaymentMethodItem(item: savedCards[index]);
                    },
                  ),
                  PaymentMethodItem(
                    additionOnTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.addPaymentCard);
                    },
                  ),
                  const SizedBox(height: 24.0),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        final value=state is PaymentMethodChosen?state.choosenMethodId:null;
                        if(value!=null){
                        Navigator.of(context).pop(value);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: AppColor.white),
                      child: const Text('Confirm Payment!'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
