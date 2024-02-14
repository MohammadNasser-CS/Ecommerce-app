import 'package:e_commerce/services/cart_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/models/location_model.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());
  final cartServices = CartServicesImpl();
  Future<void> getLocations() async {
    emit(LocationLoading());
    try {
      final locations = await cartServices.getLocations();
      emit(LocationLoaded(
        locations: locations,
      ));
    } catch (e) {
      emit(
        LocationError(message: e.toString()),
      );
    }
  }

  Future<void> setLocationItem(LocationModel locationModel) async {
    try {
      emit(LocationLoading());
      final selectedLocations = await cartServices.getLocations(hasQuery: true);
      if (selectedLocations.isNotEmpty) {
        await cartServices.unSetLocationItem(selectedLocations.first);
      }
      await cartServices.setLocationItem(locationModel);
      final locations = await cartServices.getLocations();
      // emit(LocationSet());
      emit(LocationLoaded(locations: locations));
    } catch (e) {
      emit(
        LocationError(message: e.toString()),
      );
    }
  }
}
