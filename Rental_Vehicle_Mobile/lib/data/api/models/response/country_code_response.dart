import '../country_code.dart';

class CountryCodeResponse {
  CountryCodeResponse({this.listCountryCode});

  List<CountryCodeItem>? listCountryCode;

  factory CountryCodeResponse.fromJson(Map<String, dynamic> json) => CountryCodeResponse(
        listCountryCode: json["list_country_code"] != null ? List<CountryCodeItem>.from(json["list_country_code"].map((x) => CountryCodeItem.fromJson(x))) : [],
      );
}
