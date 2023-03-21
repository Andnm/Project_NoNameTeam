import 'dart:async';

import '../api_constants.dart';
import '../models/response/login/login_response.dart';
import '../models/response/user/TUser.dart';
import 'base_service.dart';

class UserService extends BaseService {
  Future<LoginResponse> loginByUser(String phone, String password) async {
    final params = {"email": phone, "password": password};
    final response = await post(LOGIN_BY_PHONE, data: params, responseType: JsonType.FULL_RESPONSE);
    return LoginResponse.fromJson(response);
  }

  Future<TUser?> getUserInfo({required String userId}) async {
    final response = await get(USER_INFO);
    return TUser.fromJson(response);
  }

  Future<void> updateProfile({required TUser user}) async {
    await put(UPDATE_PROFILE, data: user.toJson());
  }
}
