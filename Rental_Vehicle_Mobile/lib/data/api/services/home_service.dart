import 'package:rental/data/api/models/response/booking/booking_response.dart';
import 'package:rental/data/api/models/response/vehicle/vehicle_item.dart';
import 'package:sprintf/sprintf.dart';

import '/data/api/api_constants.dart';
import '/data/api/models/request/booking_request.dart';
import '../../../libraries/logger/flutter_logger.dart';
import '../models/response/vehicle/vehicle_details.dart';
import 'base_service.dart';

class HomeService extends BaseService {
  Future<VehicleDetails> getVehicleDetail({required String licensePlate}) async {
    final response = await get(sprintf(VEHICLE_DETAILS, [licensePlate]));
    Logger.e('getVehicleDetail:${response}');
    return VehicleDetails.fromJson(response);
  }

  Future<List<VehicleItem>> getListVehicle(int page, int limit) async {
    final response = await get(LIST_VEHICLE);
    return List<VehicleItem>.from(response.map((item) => VehicleItem.fromJson(item)));
  }

  Future<List<BookingItem>> getListBooking(bool isAdmin, int page, int limit) async {
    final response = await get(isAdmin ? LIST_BOOKING_ADMIN : LIST_BOOKING);
    return List<BookingItem>.from(response.map((item) => BookingItem.fromJson(item)));
  }

  Future<void> createBookingVehicle({required BookingRequest dataPost}) async {
    await post(BOOKING_VEHICLE, data: dataPost.toJson());
  }
}
