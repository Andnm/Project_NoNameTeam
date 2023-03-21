import '/data/api/models/facility_item.dart';
import '/data/api/models/room_price.dart';

class RoomItem {
  String? bookingType;
  String? cancelPolicy;
  String? content;
  String? coverImage;
  String? createdAt;
  int? currentPrice;
  String? description;
  List<FacilityItem>? facilities;
  String? id;
  int? maximumGuests;
  String? name;
  int? numOfRoom;
  String? paymentPolicy;
  List<String>? photos;
  RoomPrice? price;

  RoomItem(
      {this.bookingType,
      this.cancelPolicy,
      this.content,
      this.coverImage,
      this.createdAt,
      this.currentPrice,
      this.description,
      this.facilities,
      this.id,
      this.maximumGuests,
      this.name,
      this.numOfRoom,
      this.paymentPolicy,
      this.photos,
      this.price});

  RoomItem.fromJson(Map<String, dynamic> json) {
    bookingType = json['bookingType'];
    cancelPolicy = json['cancelPolicy'];
    content = json['content'];
    coverImage = json['coverImage'];
    createdAt = json['createdAt'];
    currentPrice = json['currentPrice'];
    description = json['description'];
    if (json['facilities'] != null) {
      facilities = <FacilityItem>[];
      json['facilities'].forEach((v) {
        facilities!.add(new FacilityItem.fromJson(v));
      });
    }
    id = json['id'];
    maximumGuests = json['maximumGuests'];
    name = json['name'];
    numOfRoom = json['numOfRoom'];
    paymentPolicy = json['paymentPolicy'];
    photos = json['photos'] != null ? json['photos'].cast<String>() : [];
    price = json['price'] != null ? new RoomPrice.fromJson(json['price']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bookingType'] = this.bookingType;
    data['cancelPolicy'] = this.cancelPolicy;
    data['content'] = this.content;
    data['coverImage'] = this.coverImage;
    data['createdAt'] = this.createdAt;
    data['currentPrice'] = this.currentPrice;
    data['description'] = this.description;
    if (this.facilities != null) {
      data['facilities'] = this.facilities!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['maximumGuests'] = this.maximumGuests;
    data['name'] = this.name;
    data['numOfRoom'] = this.numOfRoom;
    data['paymentPolicy'] = this.paymentPolicy;
    data['photos'] = this.photos;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    return data;
  }
}
