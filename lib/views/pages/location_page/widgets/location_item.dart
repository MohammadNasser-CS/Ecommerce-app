import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Utils/app_color.dart';
import 'package:e_commerce/controllers/location_page_cubit/location_cubit.dart';
import 'package:e_commerce/models/location_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationItem extends StatelessWidget {
  final LocationModel item;
  const LocationItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LocationCubit>(context);
    return BlocBuilder<LocationCubit, LocationState>(
      bloc: cubit,
      buildWhen: (previous, current) => current is LocationLoaded,
      builder: (context, state) {
        if (state is LocationLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                    color: item.isSelected
                        ? AppColor.red
                        : AppColor.grey.withOpacity(0.3),
                    width: 2.5),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.country,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                item.cityName,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      color: AppColor.grey,
                                    ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircleAvatar(
                      radius: 35,
                      child: CachedNetworkImage(
                        imageUrl: item.imgUrl,
                        placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator.adaptive()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
