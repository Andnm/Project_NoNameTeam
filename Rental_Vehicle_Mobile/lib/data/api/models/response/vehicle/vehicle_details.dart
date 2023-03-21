import 'package:rental/libraries/logger/flutter_logger.dart';

class VehicleDetails {
  VehicleDetails({
    this.id,
    this.licensePlate,
    this.vehicleType,
    this.manufacturer,
    this.model,
    this.yearOfManufacturer,
    this.fuelType,
    this.transmission,
    this.v,
  });

  @override
  String toString() {
    return 'VehicleItem{id: $id, licensePlate: $licensePlate, vehicleType: $vehicleType, manufacturer: $manufacturer, model: $model, yearOfManufacturer: $yearOfManufacturer, fuelType: $fuelType, transmission: $transmission, v: $v}';
  }

  VehicleDetails.fromJson(dynamic json) {
    try {
      id = json['_id'];
      licensePlate = json['licensePlate'];
      vehicleType = json['vehicleType'];
      manufacturer = json['manufacturer'];
      model = json['model'];
      yearOfManufacturer = json['yearOfManufacturer'];
      fuelType = json['fuelType'];
      transmission = json['transmission'];
      v = json['__v'];
    } catch (e) {
      Logger.e(e);
    }
  }

  String? id;
  String? licensePlate;
  String? vehicleType;
  String? manufacturer;
  String? model;
  String? yearOfManufacturer;
  String? fuelType;
  String? transmission;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['licensePlate'] = licensePlate;
    map['vehicleType'] = vehicleType;
    map['manufacturer'] = manufacturer;
    map['model'] = model;
    map['yearOfManufacturer'] = yearOfManufacturer;
    map['fuelType'] = fuelType;
    map['transmission'] = transmission;
    map['__v'] = v;
    return map;
  }
}
