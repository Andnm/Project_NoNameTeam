import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '/data/api/respositories/common_repository.dart';
import '/data/api/respositories/home_repository.dart';
import '/data/api/respositories/user_repository.dart';
import '/data/api/services/common_service.dart';
import '/data/api/services/home_service.dart';
import '/data/api/services/user_service.dart';
import '/libraries/photo_manager/photo_provider.dart';

enum Environment { dev, prod, staging }

setupLocator() async {
  //Setup service
  Get.lazyPut<UserService>(() => UserService(), fenix: true);
  Get.lazyPut<CommonService>(() => CommonService(), fenix: true);
  Get.lazyPut<HomeService>(() => HomeService(), fenix: true);

  //Setup responsitory
  Get.lazyPut<UserRepository>(() => UserRepository(), fenix: true);
  Get.lazyPut<CommonRepository>(() => CommonRepository(), fenix: true);
  Get.lazyPut<HomeRepository>(() => HomeRepository(), fenix: true);
  Get.put(AssetPathProvider());

  Get.put(PhotoProvider());
}

setupStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark));
}
