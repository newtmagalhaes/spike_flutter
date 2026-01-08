import 'package:json_annotation/json_annotation.dart';
import 'package:spike_flutter/data/services/api/json_placeholder_api/models/address.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  final int id;
  String name;
  String username;
  String email;
  Address address;

  User(this.id, this.name, this.username, this.email, this.address);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
