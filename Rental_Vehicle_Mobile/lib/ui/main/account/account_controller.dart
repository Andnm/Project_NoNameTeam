import 'package:get/get.dart';

import '/app/app_controller.dart';
import '/app/app_pages.dart';
import '/ui/base/base_controller.dart';

class AccountController extends BaseController {
  final user = Get.find<AppController>().user!;

  onGotoNotificationsPage() {
    Get.toNamed(AppRoutes.LIST_NOTIFICATION);
  }
}
