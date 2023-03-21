import '/data/api/models/city_item.dart';
import '/data/api/models/place.dart';

class PlaceItem extends Place {
  String? name;
  String? address;
  CityItem? city;

  PlaceItem({this.name, this.address, this.city});

  @override
  String getName() {
    return name ?? "";
  }

  @override
  String getSubTitle() {
    return address ?? "";
  }

  @override
  CityItem? getCity() => city;
}
