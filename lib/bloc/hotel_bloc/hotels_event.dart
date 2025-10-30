abstract class HotelsEvent {}
class FetchHotels extends HotelsEvent {
  final String? query;
  FetchHotels({this.query});
}
