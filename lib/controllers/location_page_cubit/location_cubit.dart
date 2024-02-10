import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/models/address_choose_item_model.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());
  void getLocationData() {
    emit(LocationLoading());
    Future.delayed(const Duration(seconds: 1), () {
      emit(LocationLoaded(myAddressItems: dummyAddresses));
    });
  }

  void changeSelectedIndex(String itemId) {
    final index = dummyAddresses.indexWhere((item) => item.id == itemId);
    for (int i = 0; i < dummyAddresses.length; i++) {
      if (i == index) {
        dummyAddresses[i] = dummyAddresses[i].copyWith(
          isSelected: true,
        );
      } else {
        dummyAddresses[i] = dummyAddresses[i].copyWith(
          isSelected: false,
        );
      }
    }
    emit(LocationIndexChange(myAddressItems: dummyAddresses));
  }
}
