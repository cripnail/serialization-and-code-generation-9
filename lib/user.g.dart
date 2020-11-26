// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    name: json['name'] as String ?? 'Гость',
    userName: json['user_name'] as String,
    email: json['email'] as String,
    address: json['address'] == null
        ? null
        : UserAddress.fromJson(json['address'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'user_name': instance.userName,
      'email': instance.email,
      'address': instance.address,
    };

UserAddress _$UserAddressFromJson(Map<String, dynamic> json) {
  return UserAddress(
    street: json['street'] as String,
    zipcode: json['zipcode'] as String,
    city: json['city'] as String,
    suite: json['suite'] as String,
  );
}

Map<String, dynamic> _$UserAddressToJson(UserAddress instance) =>
    <String, dynamic>{
      'street': instance.street,
      'zipcode': instance.zipcode,
      'city': instance.city,
      'suite': instance.suite,
    };
