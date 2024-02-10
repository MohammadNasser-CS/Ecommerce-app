import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/models/search_popular_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  void getSearchPageData() {
    emit(SearchLoading());
    Future.delayed(const Duration(seconds: 1), () {
      emit(
        SearchLoaded(
          searchPopulerModel: dummySearch,
        ),
      );
    });
  }
}
