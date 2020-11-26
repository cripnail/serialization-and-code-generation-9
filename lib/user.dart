import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;

  @JsonKey(defaultValue: 'Гость')
  final String name;

  @JsonKey(name: 'user_name')
  final String userName;
  final String email;
  final UserAddress address;

  User({this.id, this.name, this.userName, this.email, this.address});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserAddress {
  final String street;
  final String zipcode;
  final String city;
  final String suite;

  UserAddress ({
    this.street,
    this.zipcode,
    this.city,
    this.suite,
  });
  factory UserAddress.fromJson(Map<String, dynamic> json) => _$UserAddressFromJson(json);
  Map<String, dynamic> toJson() => _$UserAddressToJson(this);
}