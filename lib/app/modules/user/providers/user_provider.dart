import 'package:breeze_flutter/app/data/providers/api_provider.dart';
import 'package:get/get.dart';

import '../user_model.dart';

class UserProvider extends ApiProvider {
  @override
  void onInit() {
    super.onInit();
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return User.fromJson(map);
      if (map is List) return map.map((item) => User.fromJson(item)).toList();
    };
  }

  Future<User?> getCurrentUser() async {
    final response = await get('/user');
    return response.body;
  }

  Future<Response<User>> postUser(User user) async =>
      await post('/user', user.toJson());
  Future<Response> deleteUser(int id) async => await delete('/user');
}
