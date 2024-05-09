// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestVehicleModelEntityImpl _$$RestVehicleModelEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$RestVehicleModelEntityImpl(
      id: (json['id'] as num).toInt(),
      img: json['img'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$RestVehicleModelEntityImplToJson(
        _$RestVehicleModelEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'img': instance.img,
      'name': instance.name,
    };
