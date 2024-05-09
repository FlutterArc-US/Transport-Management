// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_load.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestLoadEntityImpl _$$RestLoadEntityImplFromJson(Map<String, dynamic> json) =>
    _$RestLoadEntityImpl(
      id: (json['id'] as num).toInt(),
      cost: json['cost'] as num,
      date: json['date'] as String,
      weight: json['weight'] as num,
      distance: json['distance'] as num,
      deadHead: json['deadHead'] as num,
      dropTime: json['dropTime'] as String?,
      pickupTime: json['pickupTime'] as String?,
      pickup:
          RestLocationEntity.fromJson(json['pickup'] as Map<String, dynamic>),
      delivery:
          RestLocationEntity.fromJson(json['delivery'] as Map<String, dynamic>),
      vehicleModel: RestVehicleModelEntity.fromJson(
          json['vehicleModel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RestLoadEntityImplToJson(
        _$RestLoadEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cost': instance.cost,
      'date': instance.date,
      'weight': instance.weight,
      'distance': instance.distance,
      'deadHead': instance.deadHead,
      'dropTime': instance.dropTime,
      'pickupTime': instance.pickupTime,
      'pickup': instance.pickup,
      'delivery': instance.delivery,
      'vehicleModel': instance.vehicleModel,
    };
