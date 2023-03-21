import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '/ui/base/base_controller.dart';

class MainController extends BaseController {
  late PageController pageController;
  RxInt pageIndex = 0.obs;

  MainController() {
    pageController = PageController();
  }

  onTabChanged(int index) {
    pageController.jumpToPage(index);
    pageIndex.value = index;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
