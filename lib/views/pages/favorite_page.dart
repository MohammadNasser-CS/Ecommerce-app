import 'package:e_commerce/Utils/app_routes.dart';
import 'package:e_commerce/controllers/favorite_page_cubit/favorite_cubit.dart';
import 'package:e_commerce/models/favorite_serach_category_model.dart';
import 'package:e_commerce/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});
  @override
  Widget build(BuildContext context) {
    final cubitBase = BlocProvider.of<FavoriteCubit>(context);
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      buildWhen: (previous, current) {
        return current is FavoriteLoaded;
      },
      bloc: cubitBase,
      builder: (context, state) {
        if (state is FavoriteLoading) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator.adaptive()));
        } else if (state is FavoriteLoaded) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 35,
                      ),
                      suffixIcon: const Icon(
                        Icons.settings,
                        color: Colors.grey,
                        size: 35,
                      ),
                      hintText: 'Search something...',
                      hintStyle:
                          const TextStyle(fontSize: 18, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      itemCount: favoriteSearchCategory.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsetsDirectional.only(end: 8.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    favoriteSearchCategory[index]
                                        .favoriteCategory,
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Expanded(
                    child: BlocBuilder<FavoriteCubit, FavoriteState>(
                      bloc: cubitBase,
                      buildWhen: (previous, current) =>
                          current is FavroiteChangeLoaded ||
                          current is FavoriteLoaded,
                      builder: (context, state) {
                        if (state is FavroiteChangeLoaded) {
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
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pushNamed(
                                  AppRoutes.details,
                                  arguments: state.products[index],
                                );
                              },
                              child: ProductItem(
                                cubit: cubitBase,
                                productItemModel: state.products[index],
                              ),
                            ),
                          );
                        } else if (state is FavoriteLoaded) {
                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 30,
                              crossAxisSpacing: 22,
                              childAspectRatio: 0.75,
                            ),
                            itemCount: state.productItems.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => state
                                    .productItems[index].isFavorite
                                ? InkWell(
                                    onTap: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pushNamed(
                                        AppRoutes.details,
                                        arguments: state.productItems[index],
                                      );
                                    },
                                    child: ProductItem(
                                      cubit: cubitBase,
                                      productItemModel:
                                          state.productItems[index],
                                    ),
                                  )
                                : null,
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  )
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
