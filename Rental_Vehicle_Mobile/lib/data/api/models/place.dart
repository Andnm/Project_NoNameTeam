import '/data/api/models/city_item.dart';

abstract class Place {
  String getName();

  String getSubTitle();

  CityItem? getCity();
}
