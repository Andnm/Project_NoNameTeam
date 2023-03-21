import 'country.dart';

class CountryCodeItem {
  CountryCodeItem({this.countryCode, this.country});

  String? countryCode;
  Country? country;

  factory CountryCodeItem.fromJson(Map<String, dynamic> json) => CountryCodeItem(
        countryCode: json["CountryCode"] ?? "",
        country: json["Country"] != null ? Country.fromJson(json["Country"]) : null,
      );

  @override
  String toString() {
    return 'CountryCodeItem{countryCode: $countryCode}';
  }
}
