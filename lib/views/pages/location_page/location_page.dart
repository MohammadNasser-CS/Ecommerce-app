import 'package:e_commerce/Utils/app_color.dart';
import 'package:e_commerce/controllers/location_page_cubit/location_cubit.dart';
import 'package:e_commerce/views/pages/location_page/widgets/location_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationChoosePage extends StatelessWidget {
  const LocationChoosePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LocationCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose your location',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Let\'s find your unforgettable event. Choose a location below to get started.',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: AppColor.grey),
              ),
              const SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.location_on_outlined,
                    size: 40,
                  ),
                  suffixIcon: const Icon(Icons.my_location_outlined),
                  hintText: 'Tulkarem,PA',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Select location',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16.0),
              BlocBuilder<LocationCubit, LocationState>(
                bloc: cubit,
                buildWhen: (previous, current) =>
                    current is LocationIndexChange ||
                    current is LocationLoaded ||
                    current is LocationLoading,
                builder: (context, state) {
                  if (state is LocationLoading) {
                    return const Center(
                        heightFactor: 5,
                        child: CircularProgressIndicator.adaptive());
                  } else if (state is LocationIndexChange) {
                    return ListView.builder(
                      itemCount: state.locations.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = state.locations[index];
                        return InkWell(
                            onTap: () =>
                                cubit.setLocationItem(state.locations[index]),
                            child: LocationItem(item: item));
                      },
                    );
                  } else if (state is LocationLoaded) {
                    return ListView.builder(
                      itemCount: state.locations.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = state.locations[index];
                        return InkWell(
                            onTap: () =>
                                cubit.setLocationItem(state.locations[index]),
                            child: LocationItem(item: item));
                      },
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: AppColor.white),
                  child: const Text('Confirme!'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
