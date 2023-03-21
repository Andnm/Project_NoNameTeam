class Country {
  Country({this.id, this.iso2, this.logo, this.name});

  int? id;
  String? iso2;
  String? name;
  String? logo;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["Id"] ?? 0,
        iso2: json["Iso2"] ?? "",
        name: json["Name"] ?? "",
        logo: json["Logo"] ?? "",
      );
}
