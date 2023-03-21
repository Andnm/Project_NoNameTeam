import 'package:get/get.dart';
import 'package:rental/data/api/models/response/booking/booking_response.dart';
import 'package:rental/data/api/respositories/home_repository.dart';

import '/ui/base/base_controller.dart';
import '../../../data/storage/data_constant.dart';
import '../../../data/storage/rental_storage.dart';
import '../../../libraries/logger/flutter_logger.dart';
import '../../base/base_page.dart';

class BookingController extends BaseController {
  final homeRepository = Get.find<HomeRepository>();

  List<BookingItem> get listBooking => _listBooking$.value;
  final _listBooking$ = <BookingItem>[].obs;
  final rentalStorage = Get.find<RentalStorage>();
  List<String> filter = ["None", "LicensePlate", "Status", "Price", "UserName"];
  late RxString selectedFilter;

  ViewState get initState => ViewState.loaded;

  @override
  int get typeViewNoti => 3;

  @override
  void onInit() async {
    super.onInit();
    selectedFilter = filter[0].obs;
    syncListBooking();
  }

  void syncFilter(String value) async {
    selectedFilter.value = value;
    final index = filter.indexWhere((element) => element == value);
    Logger.e("syncFilter:$index listBookingRoot=");
    switch (index) {
      case 0:
        syncListBooking();
        break;
      case 1:
        _listBooking$.value.sort((a, b) => (a.licensePlate ?? "").compareTo(b.licensePlate ?? ""));
        break;
      case 2:
        _listBooking$.value.sort((a, b) => (a.bookingStatus ?? "").compareTo(b.bookingStatus ?? ""));
        break;
      case 3:
        _listBooking$.value.sort((a, b) => (a.totalPrice ?? 0).compareTo(b.totalPrice ?? 0));
        break;
      case 4:
        _listBooking$.value.sort((a, b) => (a.userId?.displayName ?? "").compareTo(b.userId?.displayName ?? ""));
        break;
    }
  }

  void syncListBooking() async {
    try {
      showLoading();
      final role = await rentalStorage.getUserRole();
      Logger.e("roleId::${role}");
      final isAdmin = role == ROLE_ADMIN;
      _listBooking$.value = await homeRepository.getListBooking(isAdmin, 1, 1);
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
