import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/Utils/app_color.dart';
import 'package:e_commerce/controllers/product_details_cubit/product_details_cubit.dart';
import 'package:e_commerce/views/pages/product_details_page/widgets/product_details_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      buildWhen: (previous, current) =>
          current is ProductDetailsLoading || current is ProductDetailsLoaded || current is ProductDetailsError,
      builder: (context, state) {
        if (state is ProductDetailsLoading) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator.adaptive()));
        } else if (state is ProductDetailsLoaded) {
          final cubit = BlocProvider.of<ProductDetailsCubit>(context);
          return Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text('Product Details'),
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios_new_outlined),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    cubit.changeFavorite(state.product.id);
                  },
                  icon: Icon(
                    state.product.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: AppColor.red,
                  ),
                ),
                const SizedBox(width: 12.0),
              ],
            ),
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: CachedNetworkImage(
                          imageUrl: state.product.imgUrl,
                          fit: BoxFit.contain,
                          placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator.adaptive()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height > 800 ? size.height * 0.1 : 8.0),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return BottomSheet(
                                    onClosing: () {},
                                    builder: (context) => StatefulBuilder(
                                      builder: (context, setState) =>
                                          BlocProvider.value(
                                        value: cubit,
                                        child: ProductDetailsDialog(
                                            productItemModel: state.product),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )),
                            child: const Text('Checkout'),
                          ),
                        ),
                      ],
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
