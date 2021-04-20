import 'package:dio/dio.dart';

import '../../../helpers/toast_helpers.dart';

class ApiException {
  Response<dynamic> response;

  ApiException(errorsResponse) {
    response = errorsResponse;

    showErrors();
  }

  showErrors() {
    print(response);
    print(response.statusCode);
    print(response.data);

    /* Se retornar o codigo de erro de validação 422 entrar */
    if (response.statusCode == 422) {
      Map errors = response.data['errors'];

      if (errors != null) {
        String allErrors = "";

        errors.forEach((key, value) => allErrors = allErrors + value[0] + "\n");

        return FlutterFoodToast.error(allErrors);
      }

      return FlutterFoodToast.error('Dados inválidos');
      /* Aqui verificamos se o erro http ocorreu por algum problema no backend */
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      return FlutterFoodToast.error('Requisição inválida');
    }

    return FlutterFoodToast.error(
        'Falha ao fazer a requisição (tente novamente mais tarde)');
  }
}
