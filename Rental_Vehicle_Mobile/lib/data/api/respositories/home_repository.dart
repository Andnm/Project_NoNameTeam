import 'package:get/get.dart';
import 'package:rental/data/api/models/response/booking/booking_response.dart';
import 'package:rental/data/api/models/response/vehicle/vehicle_item.dart';

import '/data/api/models/request/booking_request.dart';
import '/data/api/services/home_service.dart';
import '../models/response/vehicle/vehicle_details.dart';
import 'base_repository.dart';

class HomeRepository extends BaseRepository {
  final _homeService = Get.find<HomeService>();

  Future<VehicleDetails> getVehicleDetail({required String licensePlate}) async {
    final vehicle = await _homeService.getVehicleDetail(licensePlate: licensePlate);
    return vehicle;
  }

  Future<List<VehicleItem>> getListVehicle(int page, int limit) async => _homeService.getListVehicle(page, limit);

  Future<void> createBookingVehicle({required BookingRequest dataPost}) async {
    await _homeService.createBookingVehicle(dataPost: dataPost);
  }

  Future<List<BookingItem>> getListBooking(bool isAdmin, int page, int limit) async => _homeService.getListBooking(isAdmin, page, limit);
}
