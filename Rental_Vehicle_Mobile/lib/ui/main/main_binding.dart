import 'package:get/get.dart';

import '/ui/main/account/account_controller.dart';
import '/ui/main/booking/booking_controller.dart';
import '/ui/main/home/home_controller.dart';
import '/ui/main/main_controller.dart';
import '/ui/main/notification/noti_controller.dart';
import '/ui/main/support/support_controller.dart';
import '/ui/main/trip/trip_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    //Home
    Get.put(HomeController());

    //Notification
    Get.put(NotificationController());

    //Trip
    Get.put(TripController());

    //Support
    Get.put(BookingController());

    //Support
    Get.put(SupportController());

    //Account
    Get.lazyPut<AccountController>(() => AccountController());
  }
}
