import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental/data/api/models/request/booking_request.dart';

import '/data/api/models/response/vehicle/vehicle_item.dart';
import '/ui/base/base_controller.dart';
import '../../../../data/api/exceptions/api_exception.dart';
import '../../../../data/api/models/response/vehicle/vehicle_details.dart';
import '../../../../data/api/respositories/home_repository.dart';
import '../../../../libraries/logger/flutter_logger.dart';
import '../../../../utils/date_time_utils.dart';
import '../../../base/base_page.dart';

class TripDetailController extends BaseController {
  final homeRepository = Get.find<HomeRepository>();
  VehicleItem detailArgument = Get.arguments as VehicleItem;

  VehicleDetails get vehicleItem => _vehicleItem$.value;
  final _vehicleItem$ = VehicleDetails().obs;
  DateTime selectedDate = DateTime.now();
  final StreamController listenerBookingStart = StreamController<String>.broadcast();
  final StreamController listenerBookingEnd = StreamController<String>.broadcast();
  final StreamController listenerTotalPrice = StreamController<int>.broadcast();
  var bookingRequest = BookingRequest(null, null, null, false);
  int bookingStart = 0;
  int bookingEnd = 0;
  int dayCount = 0;

  ViewState get initState => ViewState.loaded;

  @override
  int get typeViewNoti => 3;

  @override
  void onInit() {
    super.onInit();
    syncVehicleDetails();
  }

  void bookingDateStart() async {
    final DateTime? selected = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );
    if (selected != null && selected != selectedDate) {
      bookingStart = selected.day;
      final date = "${selected.year}-${selected.month}-${selected.day}";
      listenerBookingStart.add(date);
      bookingRequest.bookingStart = date;
      countPrice();
    }
  }

  void bookingDateEnd() async {
    final DateTime? selected = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );
    if (selected != null && selected != selectedDate) {
      bookingEnd = selected.day;
      final date = "${selected.year}-${selected.month}-${selected.day}";
      listenerBookingEnd.add(date);
      bookingRequest.bookingEnd = date;
      countPrice();
    }
  }

  void countPrice() {
    dayCount = bookingEnd - bookingStart;
    if (dayCount >= 0) {
      listenerTotalPrice.add(dayCount * detailArgument.price);
    } else {
      listenerTotalPrice.add(0);
    }
  }

  void bookingVehicle() async {
    try {
      Logger.e("bookingVehicle::$dayCount");
      if (dayCount <= 0) {
        showErrors(ApiException(message: "Vui lòng chọn lại ngày kết thúc lớn hơn ngày bắt đầu!"));
        hideLoading();
        return;
      }
      showLoading();
      Logger.e('bookingRequest:${bookingRequest}');
      await homeRepository.createBookingVehicle(dataPost: bookingRequest);
      Logger.e('syncVehicleDetails:${vehicleItem}');
      hideLoading();
    } catch (e) {
      hideLoading();
    }
  }

  void syncVehicleDetails() async {
    try {
      bookingRequest.licensePlate = detailArgument.licensePlate;
      showLoading();
      _vehicleItem$.value = await homeRepository.getVehicleDetail(licensePlate: detailArgument.licensePlate ?? "");
      Logger.e('syncVehicleDetails:${vehicleItem}');
      hideLoading();
      final datetime = getDMYByTimeStamp(selectedDate.millisecondsSinceEpoch, isReverse: true);
      listenerBookingStart.add(datetime);
      listenerBookingEnd.add(datetime);
    } catch (e) {
      Logger.e(e);
      showErrors(e);
    }
  }

  @override
  void dispose() {
    listenerTotalPrice.close();
    listenerBookingStart.close();
    listenerBookingEnd.close();
    super.dispose();
  }
}
