import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import '../res/languages/localization_service.dart';
import 'app_controller.dart';
import 'app_pages.dart';

class RentalApp extends GetWidget<AppController> {
  const RentalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Obx(() => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Rental",
            translations: LocalizationService(),
            locale: controller.locale?.value,
            theme: controller.themeData?.value,
            initialRoute: _getRoute(),
            getPages: AppPages.pages,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', 'US'), // English
              Locale('vi', 'VN'), // German
            ],
          )),
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }

  String _getRoute() {
    switch (controller.authState.value) {
      case AuthState.unauthorized:
        return AppRoutes.INITIAL;
      case AuthState.authorized:
        return AppRoutes.MAIN;
      case AuthState.new_install:
        return AppRoutes.MAIN;
      case AuthState.uncompleted:
        return AppRoutes.UPDATE_PROFILE;
      default:
        return AppRoutes.MAIN;
    }
  }
}
