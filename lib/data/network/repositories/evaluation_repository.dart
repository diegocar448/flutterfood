import '../../../constants/api.dart';
import '../dio_client.dart';

class EvaluationRepository {
  var _httpClient;

  /* construtor */
  EvaluationRepository() {
    _httpClient = new DioClient();
  }

  Future evaluationOrder(String orderIdentify, int stars,
      {String comment}) async {
    final response = await _httpClient.post(
        "/auth/$API_VERSION//orders/$orderIdentify/evaluations",
        formData: {
          'identify': orderIdentify,
          'stars': stars,
          'comment': comment ?? ''
        });

    return response;
  }
}
