import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/search_popular_model.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  void getSearchPageData() {
    emit(SearchLoading());
    Future.delayed(const Duration(seconds: 4), () {
      emit(
        SearchLoaded(
          searchPopulerModel: dummySearch,
        ),
      );
    });
  }
}
