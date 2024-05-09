// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestLocationEntityImpl _$$RestLocationEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$RestLocationEntityImpl(
      id: (json['id'] as num).toInt(),
      address: json['address'] as String,
      lat: json['lat'] as num,
      lng: json['lng'] as num,
    );

Map<String, dynamic> _$$RestLocationEntityImplToJson(
        _$RestLocationEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
    };
