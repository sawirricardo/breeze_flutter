import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ApiProvider extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = dotenv.env['BACKEND_URL']! + '/api';
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers.addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });
      request.headers.addIf(GetStorage().hasData('sanctum_token'),
          'Authorization', 'Bearer ${GetStorage().read('sanctum_token')}');
      return request;
    });
  }
}
