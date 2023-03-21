import 'package:rental/data/api/models/response/user/TUser.dart';

import 'date_time_converter.dart';

class BookingItem {
  BookingItem({
    this.isPaid,
    this.id,
    this.userId,
    this.licensePlate,
    this.bookingStart,
    this.bookingEnd,
    this.bookingStatus,
    this.totalPrice,
    this.hasDriver,
    this.v,
  });

  @override
  String toString() {
    return 'BookingItem{datetime: $datetime, isPaid: $isPaid, id: $id, userId: $userId, licensePlate: $licensePlate, bookingStart: $bookingStart, bookingEnd: $bookingEnd, bookingStatus: $bookingStatus, totalPrice: $totalPrice, hasDriver: $hasDriver, v: $v}';
  }

  final datetime = const DateTimeConverter();
  BookingItem.fromJson(dynamic json) {
    isPaid = json['isPaid'];
    id = json['_id'];
    userId = json['user_id'] != null ? TUser.fromJson(json['user_id']) : null;
    licensePlate = json['licensePlate'];
    bookingStart = json['bookingStart'] != null ? datetime.fromJson(json['bookingStart']) : null;
    bookingEnd = json['bookingEnd'] != null ? datetime.fromJson(json['bookingEnd']) : null;
    bookingStatus = json['bookingStatus'];
    totalPrice = json['totalPrice'];
    hasDriver = json['hasDriver'];
    v = json['__v'];
  }
  bool? isPaid;
  String? id;
  TUser? userId;
  String? licensePlate;
  DateTime? bookingStart;
  DateTime? bookingEnd;
  String? bookingStatus;
  num? totalPrice;
  bool? hasDriver;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isPaid'] = isPaid;
    map['_id'] = id;
    if (userId != null) {
      map['user_id'] = userId!.toJson();
    }
    map['licensePlate'] = licensePlate;
    map['bookingStart'] = bookingStart;
    map['bookingEnd'] = bookingEnd;
    map['bookingStatus'] = bookingStatus;
    map['totalPrice'] = totalPrice;
    map['hasDriver'] = hasDriver;
    map['__v'] = v;
    return map;
  }
}
