// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestVehicleEntityImpl _$$RestVehicleEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$RestVehicleEntityImpl(
      id: (json['id'] as num).toInt(),
      model: RestVehicleModelEntity.fromJson(
          json['model'] as Map<String, dynamic>),
      vehicleLicenseNo: json['vehicleLicenseNo'] as String,
    );

Map<String, dynamic> _$$RestVehicleEntityImplToJson(
        _$RestVehicleEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'model': instance.model,
      'vehicleLicenseNo': instance.vehicleLicenseNo,
    };
