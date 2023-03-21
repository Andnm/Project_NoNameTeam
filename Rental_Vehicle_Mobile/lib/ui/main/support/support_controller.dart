import 'package:get/get.dart';

import '/ui/base/base_controller.dart';
import '../../../data/api/models/response/user/TUser.dart';
import '../../../data/storage/rental_storage.dart';
import '../../base/base_page.dart';

class SupportController extends BaseController {
  final rentalStorage = Get.find<RentalStorage>();
  late TUser user;

  ViewState get initState => ViewState.loaded;

  @override
  int get typeViewNoti => 3;

  @override
  void onInit() {
    super.onInit();
    syncUser();
  }

  void syncUser() async {
    user = (await rentalStorage.getUserInfo())!;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
