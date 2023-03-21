class RoomPrice {
  int? additionalChildrenFee;
  int? additionalGuestsFee;
  int? additionalInfantsFee;
  String? bookingType;
  String? checkinTime;
  String? checkoutTime;
  int? cleaningFee;
  String? currencyCode;
  int? monthlyPrice;
  int? nightlyPrice;
  String? note;
  int? securityFee;
  int? standardChildren;
  int? standardGuests;
  int? standardInfants;
  int? weekendPrice;

  RoomPrice(
      {this.additionalChildrenFee,
      this.additionalGuestsFee,
      this.additionalInfantsFee,
      this.bookingType,
      this.checkinTime,
      this.checkoutTime,
      this.cleaningFee,
      this.currencyCode,
      this.monthlyPrice,
      this.nightlyPrice,
      this.note,
      this.securityFee,
      this.standardChildren,
      this.standardGuests,
      this.standardInfants,
      this.weekendPrice});

  RoomPrice.fromJson(Map<String, dynamic> json) {
    additionalChildrenFee = json['additionalChildrenFee'];
    additionalGuestsFee = json['additionalGuestsFee'];
    additionalInfantsFee = json['additionalInfantsFee'];
    bookingType = json['bookingType'];
    checkinTime = json['checkinTime'];
    checkoutTime = json['checkoutTime'];
    cleaningFee = json['cleaningFee'];
    currencyCode = json['currencyCode'];
    monthlyPrice = json['monthlyPrice'];
    nightlyPrice = json['nightlyPrice'];
    note = json['note'];
    securityFee = json['securityFee'];
    standardChildren = json['standardChildren'];
    standardGuests = json['standardGuests'];
    standardInfants = json['standardInfants'];
    weekendPrice = json['weekendPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['additionalChildrenFee'] = this.additionalChildrenFee;
    data['additionalGuestsFee'] = this.additionalGuestsFee;
    data['additionalInfantsFee'] = this.additionalInfantsFee;
    data['bookingType'] = this.bookingType;
    data['checkinTime'] = this.checkinTime;
    data['checkoutTime'] = this.checkoutTime;
    data['cleaningFee'] = this.cleaningFee;
    data['currencyCode'] = this.currencyCode;
    data['monthlyPrice'] = this.monthlyPrice;
    data['nightlyPrice'] = this.nightlyPrice;
    data['note'] = this.note;
    data['securityFee'] = this.securityFee;
    data['standardChildren'] = this.standardChildren;
    data['standardGuests'] = this.standardGuests;
    data['standardInfants'] = this.standardInfants;
    data['weekendPrice'] = this.weekendPrice;
    return data;
  }
}
