import '../../../constants/api.dart';
import '../../../models/Food.dart';
import '../dio_client.dart';

class CategoryRepository {
  var _httpClient;

  /* construtor */
  CategoryRepository() {
    _httpClient = new DioClient();
  }

  Future<List<dynamic>> getCategories(String tokenCompany) async {
    final response = await _httpClient.get('$API_VERSION/categories',
        queryParameters: {'token_company': tokenCompany});
    /* url_ngrok/api/v1/products&token_company=asdqw */

    print(response);
    return (response.data['data'] as List).toList();
  }
}
