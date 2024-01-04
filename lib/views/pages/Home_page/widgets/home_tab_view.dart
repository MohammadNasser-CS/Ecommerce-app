import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Utils/app_routes.dart';
import 'package:e_commerce/controllers/home_tab_view_cubit/home_cubit.dart';
import 'package:e_commerce/controllers/product_details_cubit/product_details_cubit.dart';
import 'package:e_commerce/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubitBase = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubitBase,
      buildWhen: (previous, current) {
        return current is! ProductDetailsLoaded;
      },
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is HomeError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is HomeLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                FlutterCarousel(
                  options: CarouselOptions(
                    height: 120,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    slideIndicator: CircularWaveSlideIndicator(),
                  ),
                  items: state.carouselItems.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: CachedNetworkImage(
                              imageUrl: item.imgUrl,
                              fit: BoxFit.fill,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator.adaptive()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'New Arrivals',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('See all'),
                    )
                  ],
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  bloc: cubitBase,
                  buildWhen: (previous, current) =>
                      current is HomePageFavroiteChangeLoaded ||
                      current is HomeLoaded,
                  builder: (context, state) {
                    if (state is HomePageFavroiteChangeLoaded) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 22,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: state.products.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () async {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(
                              AppRoutes.details,
                              arguments: state.products[index],
                            ).then((value) => cubitBase.getHomeData());
                            
                          },
                          child: ProductItem(
                            cubit: cubitBase,
                            productItemModel: state.products[index],
                          ),
                        ),
                      );
                    } else if (state is HomeLoaded) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 22,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: state.products.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => InkWell(
                          onTap: ()  async {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(
                              AppRoutes.details,
                              arguments: state.products[index],
                            ).then((value) => cubitBase.getHomeData());
                            
                          },
                          child: ProductItem(
                            cubit: cubitBase,
                            productItemModel: state.products[index],
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
