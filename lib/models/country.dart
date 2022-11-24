import 'dart:convert';

List<Country> countryFromJson(String str) =>
    List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

class Country {
  Country({
    required this.name,
    required this.callingCodes,
    required this.flags,
  });

  String name;
  List<String> callingCodes;
  Flags flags;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        callingCodes: List<String>.from(json["callingCodes"].map((x) => x)),
        flags: Flags.fromJson(json["flags"]),
      );
}

class Flags {
  Flags({
    required this.svg,
    required this.png,
  });

  String svg;
  String png;

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        svg: json["svg"],
        png: json["png"],
      );
}
