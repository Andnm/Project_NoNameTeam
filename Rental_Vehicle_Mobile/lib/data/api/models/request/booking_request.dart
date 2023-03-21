class BookingRequest {
  String? bookingStart;
  String? bookingEnd;
  String? licensePlate;
  bool? hasDriver;

  BookingRequest(this.bookingStart, this.bookingEnd, this.licensePlate, this.hasDriver);

  @override
  String toString() {
    return 'BookingRequest{bookingStart: $bookingStart, bookingEnd: $bookingEnd, licensePlate: $licensePlate, hasDriver: $hasDriver}';
  }

  BookingRequest.fromJson(Map<String, dynamic> json) {
    bookingStart = json['bookingStart'];
    bookingEnd = json['bookingEnd'];
    licensePlate = json['licensePlate'];
    hasDriver = json['hasDriver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookingStart'] = bookingStart;
    data['bookingEnd'] = bookingEnd;
    data['licensePlate'] = licensePlate;
    data['hasDriver'] = hasDriver;
    return data;
  }
}
