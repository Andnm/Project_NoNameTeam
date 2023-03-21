/// firstName : "Trung"
/// lastName : "Duong"
/// gender : "Male"
/// dob : "22/02/2001"
/// address : "Ho Chi Minh"
/// phone : "838323403"
/// email : "trungduong@gmail.com"
/// password : "123456"
/// role_id : "Customer"

class TUser {
  TUser({
    this.status,
    this.id,
    this.firstName,
    this.lastName,
    this.gender,
    this.dob,
    this.address,
    this.phone,
    this.email,
    this.password,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.roleId,
    this.roleName,
    this.profit,
  });

  TUser copyWith({
    String? firstName,
    String? lastName,
    String? gender,
    String? dob,
    String? address,
    String? phone,
    String? email,
    String? password,
    String? roleId,
    String? roleName,
    bool? status,
    String? id,
    String? createdAt,
    String? updatedAt,
    num? v,
    num? profit,
  }) {
    return TUser()
      ..firstName = firstName ?? this.firstName
      ..lastName = lastName ?? this.lastName
      ..gender = gender ?? this.gender
      ..dob = dob ?? this.dob
      ..address = address ?? this.address
      ..phone = phone ?? this.phone
      ..email = email ?? this.email
      ..password = password ?? this.password
      ..roleId = roleId ?? this.roleId
      ..roleName = roleName ?? this.roleName
      ..status = status ?? this.status
      ..id = id ?? this.id
      ..createdAt = createdAt ?? this.createdAt
      ..updatedAt = updatedAt ?? this.updatedAt
      ..v = v ?? this.v
      ..profit = profit ?? this.profit;
  }

  @override
  String toString() {
    return 'TUser{firstName: $firstName, lastName: $lastName, roleName:$roleName, gender: $gender, dob: $dob, address: $address, phone: $phone, email: $email, password: $password, roleId: $roleId, status: $status, id: $id, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, profit: $profit}';
  }

  TUser.fromJson(dynamic json) {
    try {
      status = json['status'];
      id = json['_id'];
      firstName = json['firstName'];
      lastName = json['lastName'];
      gender = json['gender'];
      dob = json['dob'];
      address = json['address'];
      phone = json['phone'].toString();
      email = json['email'];
      password = json['password'];
      createdAt = json['createdAt'];
      updatedAt = json['updatedAt'];
      v = json['__v'];
      roleId = json['role_id'];
      profit = json['profit'];
    } catch (e) {}
  }

  String? firstName;
  String? lastName;
  String? gender;
  String? dob;
  String? address;
  String? phone;
  String? email;
  String? password;
  String? roleId;
  String? roleName;
  bool? status;
  String? id;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? profit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['_id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['gender'] = gender;
    map['dob'] = dob;
    map['address'] = address;
    map['phone'] = phone;
    map['email'] = email;
    map['password'] = password;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['role_id'] = roleId;
    map['profit'] = profit;
    return map;
  }

  String get displayName => "${firstName?.isNotEmpty == true ? firstName : ""} ${lastName?.isNotEmpty == true ? lastName : ""}";

  String get displayAvatar => "";
}
