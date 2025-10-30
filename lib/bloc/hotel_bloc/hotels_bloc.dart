import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/user_repository.dart';

import '../auth_bloc/auth_bloc.dart';
import 'hotels_event.dart';
import 'hotels_state.dart';

class HotelsBloc extends Bloc<HotelsEvent, HotelsState> {
  final UserRepository _userRepository;
  final AuthBloc _authBloc;

  HotelsBloc(this._userRepository, this._authBloc) : super(HotelInitial()) {
    on<FetchHotels>((event, emit) async {
      emit(HotelLoading());
      try {
        final allHotels = await _userRepository.getHotels();
        final filteredHotels = event.query == null || event.query!.isEmpty
            ? allHotels
            : allHotels.where((hotel) {
          final query = event.query!.toLowerCase();
          return hotel.propertyName!.toLowerCase().contains(query) ||
              hotel.propertyAddress!.city?.toLowerCase().contains(query) ==
                  true ||
              hotel.propertyAddress?.state?.toLowerCase().contains(query) ==
                  true ||
              hotel.propertyAddress?.country?.toLowerCase().contains(query) ==
                  true;
        }).toList();
        emit(HotelLoaded(filteredHotels));
      } catch (e) {
        emit(HotelError(e.toString()));
      }
    });
  }
}
