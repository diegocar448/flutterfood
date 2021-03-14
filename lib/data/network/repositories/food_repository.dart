import '../../../constants/api.dart';
import '../../../models/Food.dart';
import '../dio_client.dart';

class FoodRepository {
  var _httpClient;

  /* construtor */
  FoodRepository() {
    _httpClient = new DioClient();
  }

  Future<List<dynamic>> getFoods(String tokenCompany) async {
    final response = await _httpClient.get('$API_VERSION/products',
        queryParameters: {'token_company': tokenCompany});
    /* url_ngrok/api/v1/products&token_company=asdqw */

    print(response);
    return (response.data['data'] as List).toList();
  }
}
