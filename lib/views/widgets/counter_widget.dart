import 'package:e_commerce/Utils/app_color.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  final dynamic cubit;
  final int value;
  final dynamic item;
  const CounterWidget(
      {super.key,
      required this.cubit,
      required this.value,
      required this.item});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColor.grey,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => cubit.decrement(item.id),
            icon: const Icon(Icons.remove),
          ),
          Text('$value'),
          IconButton(
            onPressed: () => cubit.increment(item.id),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
