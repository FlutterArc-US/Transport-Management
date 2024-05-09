// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_driver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestDriverEntityImpl _$$RestDriverEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$RestDriverEntityImpl(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      licenseNo: json['licenseNo'] as String?,
      vehicle: json['vehicle'] == null
          ? null
          : RestVehicleEntity.fromJson(json['vehicle'] as Map<String, dynamic>),
      fleetId: (json['fleetId'] as num?)?.toInt(),
      img: json['img'] as String?,
      phonePrefix: json['phonePrefix'] as String?,
    );

Map<String, dynamic> _$$RestDriverEntityImplToJson(
        _$RestDriverEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'type': instance.type,
      'status': instance.status,
      'licenseNo': instance.licenseNo,
      'vehicle': instance.vehicle,
      'fleetId': instance.fleetId,
      'img': instance.img,
      'phonePrefix': instance.phonePrefix,
    };
