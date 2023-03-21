import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '/app/app_controller.dart';
import '/data/api/services/user_service.dart';
import '/data/storage/rental_storage.dart';
import '../models/response/user/TUser.dart';
import 'base_repository.dart';

class UserRepository extends BaseRepository {
  final _userService = Get.find<UserService>();
  final storage = Get.find<RentalStorage>();

  Future<String> loginByUser(String phone, String password) async {
    final response = await _userService.loginByUser(phone, password);
    final token = response.accessToken ?? "";
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    final role = decodedToken["user"]["roleName"];
    storage.saveUserRole(role);
    storage.saveUserAccessToken(token);
    return token;
  }

  Future<TUser?> getUserInfo({String? userId}) async {
    final user = await _userService.getUserInfo(userId: userId ?? "");
    if (user != null) {
      storage.saveUserInfo(user);
    }
    return user;
  }

  Future<void> updateProfile({required TUser profile}) async {
    await _userService.updateProfile(user: profile);
    try {
      final user = await _userService.getUserInfo(userId: profile.roleId!);
      //Save user detail
      if (user != null) {
        storage.saveUserInfo(user);
        await Get.find<AppController>().updateUserInfo(user);
      }
    } catch (e) {
      print(e);
    }
  }
}
