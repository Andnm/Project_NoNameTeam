import '/data/api/models/city_item.dart';
import '/data/api/models/facility_item.dart';
import '/data/api/models/place.dart';
import '/data/api/models/room_type.dart';

class HotelItem extends Place {
  String? address;
  String? banner;
  CityItem? city;
  String? content;
  String? createdAt;
  String? description;
  String? email;
  List<FacilityItem>? facilities;
  String? id;
  String? name;
  String? phone;
  List<String>? photos;
  int? ratings;
  List<RoomType>? roomTypes;

  HotelItem(
      {this.address,
      this.banner,
      this.city,
      this.content,
      this.createdAt,
      this.description,
      this.email,
      this.facilities,
      this.id,
      this.name,
      this.phone,
      this.photos,
      this.ratings,
      this.roomTypes});

  HotelItem.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    banner = json['banner'];
    city = json['city'] != null ? new CityItem.fromJson(json['city']) : null;
    content = json['content'];
    createdAt = json['createdAt'];
    description = json['description'];
    email = json['email'];
    if (json['facilities'] != null) {
      facilities = <FacilityItem>[];
      json['facilities'].forEach((v) {
        facilities!.add(new FacilityItem.fromJson(v));
      });
    }
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    photos = json['photos'].cast<String>();
    ratings = json['ratings'];
    if (json['roomTypes'] != null) {
      roomTypes = <RoomType>[];
      json['roomTypes'].forEach((v) {
        roomTypes!.add(new RoomType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['banner'] = this.banner;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
    data['description'] = this.description;
    data['email'] = this.email;
    if (this.facilities != null) {
      data['facilities'] = this.facilities!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['photos'] = this.photos;
    data['ratings'] = this.ratings;
    if (this.roomTypes != null) {
      data['roomTypes'] = this.roomTypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String getSubTitle() => address ?? "";

  @override
  String getName() => name ?? "";

  @override
  CityItem? getCity() => city;
}
