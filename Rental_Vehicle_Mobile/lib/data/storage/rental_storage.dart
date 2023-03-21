import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '/res/languages/localization_service.dart';
import '/res/theme/theme_service.dart';
import '../api/models/response/user/TUser.dart';

class RentalStorage {
  late GetStorage box;
  static const STORAGE_NAME = "rental_storage";
  static const USER_ACCESS_TOKEN = "user_access_token";
  static const USER_ROLE = "user_role";
  static const RENTAL_USER_INFO = "rental_user_info";
  static const APP_NEW_INSTALL = "app_new_install";
  static const APP_THEME = "app_theme";
  static const APP_LANGUAGE = "app_language";

  init() async {
    await GetStorage.init(STORAGE_NAME);
    box = GetStorage(STORAGE_NAME);
  }

  Future<void> saveUserAccessToken(String accessToken) async {
    box.write(USER_ACCESS_TOKEN, accessToken);
  }

  Future<String?> getUserAccessToken() async {
    final token = await box.read(USER_ACCESS_TOKEN);
    return token;
  }

  Future<void> saveUserRole(String role) async {
    box.write(USER_ROLE, role);
  }

  Future<String?> getUserRole() async {
    final token = await box.read(USER_ROLE);
    return token;
  }

  Future<void> saveUserInfo(TUser user) async {
    String json = jsonEncode(user.toJson());
    box.write(RENTAL_USER_INFO, json);
  }

  Future<TUser?> getUserInfo() async {
    final userJson = await box.read(RENTAL_USER_INFO);
    return userJson != null ? TUser.fromJson(json.decode(userJson)) : null;
  }

  Future<void> saveInstall(bool isInstall) async {
    box.write(APP_NEW_INSTALL, isInstall);
  }

  Future<bool> isInstall() async {
    final isInstall = await box.read(APP_NEW_INSTALL) ?? false;
    return isInstall;
  }

  Future<void> setTheme(int theme) async {
    box.write(APP_THEME, theme);
  }

  Future<int> getTheme() async {
    final theme = await box.read(APP_THEME) ?? ThemeService.LIGHT_THEME;
    return theme;
  }

  Future<void> setLanguage(String language) async {
    box.write(APP_LANGUAGE, language);
  }

  Future<String> getLanguage() async {
    final theme = await box.read(APP_LANGUAGE) ?? LocalizationService.VI_VN;
    return theme;
  }

  Future<void> logout() async {
    if (box.hasData(APP_LANGUAGE)) await box.remove(APP_LANGUAGE);
    if (box.hasData(APP_THEME)) await box.remove(APP_THEME);
    if (box.hasData(RENTAL_USER_INFO)) await box.remove(RENTAL_USER_INFO);
    if (box.hasData(USER_ROLE)) await box.remove(USER_ROLE);
    if (box.hasData(USER_ACCESS_TOKEN)) await box.remove(USER_ACCESS_TOKEN);
  }
}
