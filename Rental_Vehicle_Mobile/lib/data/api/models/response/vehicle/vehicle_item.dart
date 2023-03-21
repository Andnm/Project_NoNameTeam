import '../user/TUser.dart';

class VehicleItem {
  VehicleItem({
    this.id,
    this.userId,
    this.licensePlate,
    this.description,
    this.insurance,
    this.v,
    this.image,
    this.price = 0,
    this.isRented,
  });

  @override
  String toString() {
    return 'VehicleItem{userId: $userId, licensePlates: $licensePlates, description: $description, insurance: $insurance, price: $price, isRented: $isRented, id: $id, licensePlate: $licensePlate, v: $v, image: $image}';
  }

  VehicleItem.fromJson(dynamic json) {
    try {
      id = json['_id'];
      userId = json['user_id'] != null ? TUser.fromJson(json['user_id']) : null;
      licensePlate = json['licensePlate'];
      description = json['description'];
      insurance = json['insurance'];
      v = json['__v'];
      image = json['image'];
      price = json['price'];
      isRented = json['isRented'];
    } catch (e) {}
  }

  String? licensePlates;
  String? description;
  String? insurance;
  num price = 0;
  bool? isRented;
  String? id;
  TUser? userId;
  String? licensePlate;
  num? v;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    if (userId != null) {
      map['user_id'] = userId!.toJson();
    }
    map['licensePlate'] = licensePlate;
    map['description'] = description;
    map['insurance'] = insurance;
    map['__v'] = v;
    map['image'] = image;
    map['price'] = price;
    map['isRented'] = isRented;
    return map;
  }
}
