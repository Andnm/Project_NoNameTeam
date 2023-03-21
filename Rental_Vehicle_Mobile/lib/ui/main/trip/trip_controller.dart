import 'package:get/get.dart';
import 'package:rental/data/api/models/response/vehicle/vehicle_item.dart';
import 'package:rental/data/api/respositories/home_repository.dart';

import '/ui/base/base_controller.dart';
import '../../../libraries/logger/flutter_logger.dart';
import '../../base/base_page.dart';

class TripController extends BaseController {
  final homeRepository = Get.find<HomeRepository>();
  List<VehicleItem> get listVehicle => _listVehicle$.value;
  final _listVehicle$ = <VehicleItem>[].obs;

  ViewState get initState => ViewState.loaded;

  @override
  int get typeViewNoti => 3;

  @override
  void onInit() {
    super.onInit();
    syncListVehicle();
  }

  void syncListVehicle() async {
    try {
      showLoading();
      _listVehicle$.value = await homeRepository.getListVehicle(1, 1);
      hideLoading();
    } catch (e) {
      Logger.e(e);
      showErrors(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
