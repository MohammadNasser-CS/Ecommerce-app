import 'package:e_commerce/controllers/category_tab_view/category_cubit.dart';
import 'package:e_commerce/models/home_category_model.dart';
import 'package:e_commerce/views/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryTabView extends StatelessWidget {
  const CategoryTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      bloc: BlocProvider.of<CategoryCubit>(context),
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is CategoryError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is CategoryLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  itemCount: dummyCategories.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CategoryItem(
                        categoryItemModel: dummyCategories[index],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
