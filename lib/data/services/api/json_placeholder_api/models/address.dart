import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable(explicitToJson: true)
class Address {
  String city;
  String suite;
  String street;
  String zipcode;
  Geolocalization geo;

  Address(
    this.city,
    this.street,
    this.suite,
    this.zipcode,
    this.geo,
  );

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class Geolocalization {
  @JsonKey(name: 'lat')
  String latitude;
  @JsonKey(name: 'lng')
  String longitude;

  Geolocalization(
    this.latitude,
    this.longitude,
  );

  factory Geolocalization.fromJson(Map<String, dynamic> json) => _$GeolocalizationFromJson(json);
  Map<String, dynamic> toJson() => _$GeolocalizationToJson(this);
}
