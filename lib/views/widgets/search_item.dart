import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/search_popular_model.dart';
import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  final SearchPopulerModel searchPopulerModel;
  const SearchItem({super.key, required this.searchPopulerModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[100],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.width * 0.35,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15)),
              child: CachedNetworkImage(
                imageUrl: searchPopulerModel.imgUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator.adaptive()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  searchPopulerModel.searchTitle,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 12),
                Text(
                  '${searchPopulerModel.searchNumber} Search Today',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                  //maxLines: 2 --> this to detect for this text that ever never expand more than 2 lines at all .
                  maxLines: 2,
                  // TextOverflow.ellipsis --> if the Text is larger than the width of it's Parent width
                  // put (...) to inform user that there is more .
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 8.0),
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Text(searchPopulerModel.trendType),
            ),
          )
        ],
      ),
    );
  }
}
