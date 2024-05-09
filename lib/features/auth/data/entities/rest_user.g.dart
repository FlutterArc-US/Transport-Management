// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestUserEntityImpl _$$RestUserEntityImplFromJson(Map<String, dynamic> json) =>
    _$RestUserEntityImpl(
      company: json['company'] as String?,
      email: json['email'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      userType: json['userType'] as String,
    );

Map<String, dynamic> _$$RestUserEntityImplToJson(
        _$RestUserEntityImpl instance) =>
    <String, dynamic>{
      'company': instance.company,
      'email': instance.email,
      'image': instance.image,
      'name': instance.name,
      'phone': instance.phone,
      'userType': instance.userType,
    };
