part of 'search_cubit.dart';

sealed class SearchState {
  const SearchState();
}

final class SearchInitial extends SearchState {}
final class SearchLoading extends SearchState {}
final class SearchLoaded extends SearchState {
  final List<SearchPopulerModel> searchPopulerModel;
  const SearchLoaded({
    required this.searchPopulerModel,
  });
}
final class SearchError extends SearchState {
  final String message;
  const SearchError({
    required this.message,
  });
}