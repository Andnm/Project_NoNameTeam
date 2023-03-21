import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/data/api/api_constants.dart';
import '/data/api/rest_client.dart';
import '/data/storage/rental_storage.dart';
import '/res/languages/localization_service.dart';
import '/res/theme/app_theme.dart';
import '/res/theme/theme_service.dart';
import '../data/api/models/response/user/TUser.dart';
import '../libraries/photo_manager/photo_provider.dart';
import 'app_pages.dart';
import 'base_app_config.dart';

class AppController extends GetxController {
  Environment? env;
  Rx<Locale?>? locale;
  Rx<ThemeData?>? themeData;
  late String deviceId;
  Rx<AuthState> authState = AuthState.unauthorized.obs;
  TUser? user;

  init(Environment environment) async {
    env = environment;
    await Future.wait([initFirebase(), initStorage()]);
    await setupLocator();
    await initTheme();
    await initLanguage();
    await initAuth();
    initPhotos();
  }

  Future<void> initAuth() async {
    final storage = Get.find<RentalStorage>();
    user = await storage.getUserInfo();
    final token = await storage.getUserAccessToken();

    if (user != null && token != null) {
      await initApi(token: token);
      if (user!.roleId != null && user!.roleId!.isNotEmpty) {
        authState.value = AuthState.authorized;
      } else {
        authState.value = AuthState.uncompleted;
      }
    } else {
      await initApi();
      authState.value = AuthState.unauthorized;
    }
  }

  Future<void> initFirebase() async {
    //await Firebase.initializeApp();
  }

  Future<void> initStorage() async {
    await Get.put(RentalStorage()).init();
  }

  Future<void> initPhotos() async {
    Get.put(PhotoProvider()).init();
  }

  logout() async {
    user = null;
    locale = null;
    themeData = null;
    await Get.find<RentalStorage>().logout();
    Get.offAllNamed(AppRoutes.INITIAL);
  }

  Future<void> initTheme() async {
    await Get.put(ThemeService()).init();
    final themeService = Get.find<ThemeService>();
    themeData = themeService.themeData.obs;
    //Lang nghe su thay doi theme khi luu vao storage
    themeService.store.box.listenKey(RentalStorage.APP_THEME, (value) {
      if (value != null) if (themeData != null) {
        themeData!.value = appThemeData[themeService.getAppTheme(value)];
      } else {
        themeData = appThemeData[themeService.getAppTheme(value)].obs;
      }
    });
  }

  Future<void> initLanguage() async {
    await Get.put(LocalizationService()).init();
    final localeService = Get.find<LocalizationService>();
    locale = localeService.getLocale.obs;
    //Lang nghe su thay doi theme khi luu vao storage
    localeService.store.box.listenKey(RentalStorage.APP_LANGUAGE, (value) {
      if (value != null) locale!.value = Locale(value);
    });
  }

  initApi({String? token}) async {
    String baseUrl;
    // init api
    switch (env!) {
      case Environment.dev:
        baseUrl = BASE_URL_DEV;
        UPLOAD_PHOTO_URL = UPLOAD_PHOTO_URL_DEV;
        break;
      case Environment.staging:
        baseUrl = BASE_URL_STA;
        UPLOAD_PHOTO_URL = UPLOAD_PHOTO_URL_STA;
        break;
      case Environment.prod:
        baseUrl = BASE_URL_PROD;
        UPLOAD_PHOTO_URL = UPLOAD_PHOTO_URL_PROD;
        break;
    }
    RestClient.instance.init(
      baseUrl,
      accessToken: token ?? "",
    );
  }

  Future<void> updateUserInfo(TUser userInfo) async {
    user = userInfo;
    if (userInfo.roleId != null && user!.roleId!.isNotEmpty) {
      authState.value = AuthState.authorized;
      Get.offAllNamed(AppRoutes.MAIN);
    } else {
      authState.value = AuthState.uncompleted;
      Get.offAllNamed(AppRoutes.UPDATE_PROFILE);
    }
  }

  @override
  void onClose() {
    // Close all service
    Get.reset();
    super.onClose();
  }

  updateFirebaseToken({String? token}) async {
    // if (token == null) {
    //   token = await Get.find<TravelStorage>().getDeviceToken();
    // } else {
    //   Get.find<TravelStorage>().saveDeviceToken(token);
    // }
    // if (user != null) {
    //   String deviceId = await getDeviceId();
    //   String verName = packageInfo.version;
    //   String verCode = packageInfo.buildNumber;
    //   Get.find<UserRepository>().updateFirebaseToken(
    //       token: token!,
    //       deviceId: deviceId,
    //       verName: verName,
    //       verCode: verCode);
    // }
  }
}

EventBus eventBus = EventBus();

enum AuthState { unauthorized, authorized, uncompleted, new_install }
