import '../../../constants/api.dart';
import '../../../models/Food.dart';
import '../dio_client.dart';

class FoodRepository {
  var _httpClient;

  /* construtor */
  FoodRepository() {
    _httpClient = new DioClient();
  }

  Future<List<dynamic>> getFoods(String tokenCompany,
      {
      /* Aqui adicionamos o filtro */
      List<String> filterCategories}) async {
    final response =
        await _httpClient.get('$API_VERSION/products', queryParameters: {
      'token_company': tokenCompany,
      /* por default mas vazio para nossa query */
      'categories': (filterCategories != null && filterCategories.length > 0)
          ? filterCategories
          : []
    });
    /* url_ngrok/api/v1/products&token_company=asdqw */

    return (response.data['data'] as List).toList();
  }
}
