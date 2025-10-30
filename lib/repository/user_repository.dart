import 'HotelApiProvider.dart';
import '../data/HotelListData.dart';

class UserRepository {
  final HotelApiProvider apiProvider;

  UserRepository(this.apiProvider);

  Future<void> signInWithGoogle() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> signOut() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<List<Data>> getHotels() async {
    final hotelListData = await apiProvider.fetchHotels();
    return hotelListData.data ?? [];
  }
}
