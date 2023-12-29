part of 'location_cubit.dart';

sealed class LocationState {}

final class LocationInitial extends LocationState {}
final class LocationLoading extends LocationState {}
final class LocationLoaded extends LocationState {
  final List<AddressChooseItemModel> myAddressItems;
  LocationLoaded({required this.myAddressItems});
}
final class LocationError extends LocationState {}
final class LocationIndexChange extends LocationState{
    final List<AddressChooseItemModel> myAddressItems;

  LocationIndexChange({required this.myAddressItems});

}