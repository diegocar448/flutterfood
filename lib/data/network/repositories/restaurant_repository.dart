import '../../../constants/api.dart';
import '../../../models/Restaurant.dart';
import '../dio_client.dart';

class RestaurantRepository {
  var _httpClient;

  /* construtor */
  RestaurantRepository() {
    _httpClient = new DioClient();
  }

  Future<List<Restaurant>> getRestaurants() async {
    final response = await _httpClient.get('$API_VERSION/tenants');

    final List _restaurants = (response.data['data'] as List).map((restaurant) {
      return Restaurant.fromJson(restaurant);
    }).toList();

    return _restaurants;
  }
}
