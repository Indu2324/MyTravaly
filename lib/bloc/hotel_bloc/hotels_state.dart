import '../../data/HotelListData.dart';

abstract class HotelsState {}

class HotelInitial extends HotelsState {}

class HotelLoading extends HotelsState {}

class HotelLoaded extends HotelsState {
  final List<Data> hotels;

  HotelLoaded(this.hotels);
}

class HotelError extends HotelsState {
  final String message;

  HotelError(this.message);
}
