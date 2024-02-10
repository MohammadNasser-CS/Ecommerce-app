import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/models/home_category_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
    void getCategoryData() {
    emit(CategoryLoading());
    Future.delayed(const Duration(seconds: 1), () {
      emit(
        CategoryLoaded(
          categoryItem: dummyCategories,
        ),
      );
    });
  }
}
