import '../../../constants/api.dart';
import '../dio_client.dart';

class OrderRepository {
  var _httpClient;

  /* construtor */
  OrderRepository() {
    _httpClient = new DioClient();
  }

  Future makeOrder(String tokenCompany, List<Map<String, dynamic>> foods,
      {String comment}) async {
    final response = await _httpClient.post("/$API_VERSION/orders", formData: {
      'token_company': tokenCompany,
      'products': foods,
      'comment': comment
    });

    return response;
  }
}
