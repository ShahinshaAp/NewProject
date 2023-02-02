import 'package:json_annotation/json_annotation.dart';

part 'user_data_modell.g.dart';

@JsonSerializable()
class UserdDataModel {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  @JsonKey(name: 'profile_image')
  final String? profileImage;
  final Address? address;
  final String? phone;
  final String? website;
  final Company? company;

  UserdDataModel(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.profileImage,
      this.address,
      this.phone,
      this.website,
      this.company});

  factory UserdDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserdDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserdDataModelToJson(this);
}

@JsonSerializable()
class Address {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class Geo {
  final String? lat;
  final String? lng;

  Geo({this.lat, this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

  Map<String, dynamic> toJson() => _$GeoToJson(this);
}

@JsonSerializable()
class Company {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
