import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/product_item_modle.dart';
import 'package:e_commerce/views/widgets/product_details_dialog.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductItemModel productItemModel;
  const ProductDetailsPage({super.key, required this.productItemModel});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late ProductItemModel tempProductItem;
  @override
  void initState() {
    super.initState();
    tempProductItem = widget.productItemModel;
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Detail Product'),
        backgroundColor: Colors.grey[200],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // setState(() {
              //   int selectedItemIndex = products.indexOf(tempProductItem);
              //   products[selectedItemIndex] = tempProductItem.copyItem(
              //       isFav: !tempProductItem.isFavorite);
              //   tempProductItem = products[selectedItemIndex];
              // });
            },
            icon: const Icon(Icons.favorite_border
                // tempProductItem.isFavorite
                //     ? Icons.favorite
                //     : Icons.favorite_border,
                // color: Colors.deepOrange,
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
                    imageUrl: tempProductItem.imgUrl,
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
                                    ProductDetailsDialog(
                                        productItemModel: tempProductItem),
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                      child: const Text('Checkout'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
