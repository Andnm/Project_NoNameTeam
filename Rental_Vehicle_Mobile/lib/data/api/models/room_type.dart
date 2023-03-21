import 'package:get/get.dart';

import '/data/api/models/facility_item.dart';
import '/data/api/models/room_item.dart';

class RoomType {
  int? area;
  String? content;
  String? createdAt;
  String? description;
  List<FacilityItem>? facilities;
  String? id;
  String? name;
  List<String>? photos;
  List<RoomItem>? rooms;
  RxBool isMore = true.obs;
  String? numberOfBed;
  int? currentPrice;

  RoomType(
      {this.area,
      this.content,
      this.createdAt,
      this.description,
      this.facilities,
      this.id,
      this.name,
      this.photos,
      this.rooms,
      this.numberOfBed,
      this.currentPrice});

  RoomType.fromJson(Map<String, dynamic> json) {
    area = json['area'];
    content = json['content'];
    createdAt = json['createdAt'];
    description = json['description'];
    if (json['facilities'] != null) {
      facilities = <FacilityItem>[];
      json['facilities'].forEach((v) {
        facilities!.add(new FacilityItem.fromJson(v));
      });
    }
    id = json['id'];
    name = json['name'];
    photos = json['photos'] != null ? json['photos'].cast<String>() : [];
    numberOfBed = json['numberOfBed'];
    currentPrice = json['currentPrice'];
    if (json['rooms'] != null) {
      rooms = <RoomItem>[];
      json['rooms'].forEach((v) {
        rooms!.add(new RoomItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area'] = this.area;
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
    data['description'] = this.description;
    if (this.facilities != null) {
      data['facilities'] = this.facilities!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    data['photos'] = this.photos;
    data['numberOfBed'] = this.numberOfBed;
    data['currentPrice'] = this.currentPrice;
    if (this.rooms != null) {
      data['rooms'] = this.rooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
