// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rest_load.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RestLoadEntity _$RestLoadEntityFromJson(Map<String, dynamic> json) {
  return _RestLoadEntity.fromJson(json);
}

/// @nodoc
mixin _$RestLoadEntity {
  int get id => throw _privateConstructorUsedError;
  num get cost => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  num get weight => throw _privateConstructorUsedError;
  num get distance => throw _privateConstructorUsedError;
  num get deadHead => throw _privateConstructorUsedError;
  String? get dropTime => throw _privateConstructorUsedError;
  String? get pickupTime => throw _privateConstructorUsedError;
  RestLocationEntity get pickup => throw _privateConstructorUsedError;
  RestLocationEntity get delivery => throw _privateConstructorUsedError;
  RestVehicleModelEntity get vehicleModel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestLoadEntityCopyWith<RestLoadEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestLoadEntityCopyWith<$Res> {
  factory $RestLoadEntityCopyWith(
          RestLoadEntity value, $Res Function(RestLoadEntity) then) =
      _$RestLoadEntityCopyWithImpl<$Res, RestLoadEntity>;
  @useResult
  $Res call(
      {int id,
      num cost,
      String date,
      num weight,
      num distance,
      num deadHead,
      String? dropTime,
      String? pickupTime,
      RestLocationEntity pickup,
      RestLocationEntity delivery,
      RestVehicleModelEntity vehicleModel});

  $RestLocationEntityCopyWith<$Res> get pickup;
  $RestLocationEntityCopyWith<$Res> get delivery;
  $RestVehicleModelEntityCopyWith<$Res> get vehicleModel;
}

/// @nodoc
class _$RestLoadEntityCopyWithImpl<$Res, $Val extends RestLoadEntity>
    implements $RestLoadEntityCopyWith<$Res> {
  _$RestLoadEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cost = null,
    Object? date = null,
    Object? weight = null,
    Object? distance = null,
    Object? deadHead = null,
    Object? dropTime = freezed,
    Object? pickupTime = freezed,
    Object? pickup = null,
    Object? delivery = null,
    Object? vehicleModel = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as num,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as num,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as num,
      deadHead: null == deadHead
          ? _value.deadHead
          : deadHead // ignore: cast_nullable_to_non_nullable
              as num,
      dropTime: freezed == dropTime
          ? _value.dropTime
          : dropTime // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupTime: freezed == pickupTime
          ? _value.pickupTime
          : pickupTime // ignore: cast_nullable_to_non_nullable
              as String?,
      pickup: null == pickup
          ? _value.pickup
          : pickup // ignore: cast_nullable_to_non_nullable
              as RestLocationEntity,
      delivery: null == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as RestLocationEntity,
      vehicleModel: null == vehicleModel
          ? _value.vehicleModel
          : vehicleModel // ignore: cast_nullable_to_non_nullable
              as RestVehicleModelEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RestLocationEntityCopyWith<$Res> get pickup {
    return $RestLocationEntityCopyWith<$Res>(_value.pickup, (value) {
      return _then(_value.copyWith(pickup: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RestLocationEntityCopyWith<$Res> get delivery {
    return $RestLocationEntityCopyWith<$Res>(_value.delivery, (value) {
      return _then(_value.copyWith(delivery: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RestVehicleModelEntityCopyWith<$Res> get vehicleModel {
    return $RestVehicleModelEntityCopyWith<$Res>(_value.vehicleModel, (value) {
      return _then(_value.copyWith(vehicleModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RestLoadEntityImplCopyWith<$Res>
    implements $RestLoadEntityCopyWith<$Res> {
  factory _$$RestLoadEntityImplCopyWith(_$RestLoadEntityImpl value,
          $Res Function(_$RestLoadEntityImpl) then) =
      __$$RestLoadEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      num cost,
      String date,
      num weight,
      num distance,
      num deadHead,
      String? dropTime,
      String? pickupTime,
      RestLocationEntity pickup,
      RestLocationEntity delivery,
      RestVehicleModelEntity vehicleModel});

  @override
  $RestLocationEntityCopyWith<$Res> get pickup;
  @override
  $RestLocationEntityCopyWith<$Res> get delivery;
  @override
  $RestVehicleModelEntityCopyWith<$Res> get vehicleModel;
}

/// @nodoc
class __$$RestLoadEntityImplCopyWithImpl<$Res>
    extends _$RestLoadEntityCopyWithImpl<$Res, _$RestLoadEntityImpl>
    implements _$$RestLoadEntityImplCopyWith<$Res> {
  __$$RestLoadEntityImplCopyWithImpl(
      _$RestLoadEntityImpl _value, $Res Function(_$RestLoadEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cost = null,
    Object? date = null,
    Object? weight = null,
    Object? distance = null,
    Object? deadHead = null,
    Object? dropTime = freezed,
    Object? pickupTime = freezed,
    Object? pickup = null,
    Object? delivery = null,
    Object? vehicleModel = null,
  }) {
    return _then(_$RestLoadEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as num,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as num,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as num,
      deadHead: null == deadHead
          ? _value.deadHead
          : deadHead // ignore: cast_nullable_to_non_nullable
              as num,
      dropTime: freezed == dropTime
          ? _value.dropTime
          : dropTime // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupTime: freezed == pickupTime
          ? _value.pickupTime
          : pickupTime // ignore: cast_nullable_to_non_nullable
              as String?,
      pickup: null == pickup
          ? _value.pickup
          : pickup // ignore: cast_nullable_to_non_nullable
              as RestLocationEntity,
      delivery: null == delivery
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as RestLocationEntity,
      vehicleModel: null == vehicleModel
          ? _value.vehicleModel
          : vehicleModel // ignore: cast_nullable_to_non_nullable
              as RestVehicleModelEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestLoadEntityImpl implements _RestLoadEntity {
  const _$RestLoadEntityImpl(
      {required this.id,
      required this.cost,
      required this.date,
      required this.weight,
      required this.distance,
      required this.deadHead,
      required this.dropTime,
      required this.pickupTime,
      required this.pickup,
      required this.delivery,
      required this.vehicleModel});

  factory _$RestLoadEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestLoadEntityImplFromJson(json);

  @override
  final int id;
  @override
  final num cost;
  @override
  final String date;
  @override
  final num weight;
  @override
  final num distance;
  @override
  final num deadHead;
  @override
  final String? dropTime;
  @override
  final String? pickupTime;
  @override
  final RestLocationEntity pickup;
  @override
  final RestLocationEntity delivery;
  @override
  final RestVehicleModelEntity vehicleModel;

  @override
  String toString() {
    return 'RestLoadEntity(id: $id, cost: $cost, date: $date, weight: $weight, distance: $distance, deadHead: $deadHead, dropTime: $dropTime, pickupTime: $pickupTime, pickup: $pickup, delivery: $delivery, vehicleModel: $vehicleModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestLoadEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.deadHead, deadHead) ||
                other.deadHead == deadHead) &&
            (identical(other.dropTime, dropTime) ||
                other.dropTime == dropTime) &&
            (identical(other.pickupTime, pickupTime) ||
                other.pickupTime == pickupTime) &&
            (identical(other.pickup, pickup) || other.pickup == pickup) &&
            (identical(other.delivery, delivery) ||
                other.delivery == delivery) &&
            (identical(other.vehicleModel, vehicleModel) ||
                other.vehicleModel == vehicleModel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, cost, date, weight, distance,
      deadHead, dropTime, pickupTime, pickup, delivery, vehicleModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestLoadEntityImplCopyWith<_$RestLoadEntityImpl> get copyWith =>
      __$$RestLoadEntityImplCopyWithImpl<_$RestLoadEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestLoadEntityImplToJson(
      this,
    );
  }
}

abstract class _RestLoadEntity implements RestLoadEntity {
  const factory _RestLoadEntity(
          {required final int id,
          required final num cost,
          required final String date,
          required final num weight,
          required final num distance,
          required final num deadHead,
          required final String? dropTime,
          required final String? pickupTime,
          required final RestLocationEntity pickup,
          required final RestLocationEntity delivery,
          required final RestVehicleModelEntity vehicleModel}) =
      _$RestLoadEntityImpl;

  factory _RestLoadEntity.fromJson(Map<String, dynamic> json) =
      _$RestLoadEntityImpl.fromJson;

  @override
  int get id;
  @override
  num get cost;
  @override
  String get date;
  @override
  num get weight;
  @override
  num get distance;
  @override
  num get deadHead;
  @override
  String? get dropTime;
  @override
  String? get pickupTime;
  @override
  RestLocationEntity get pickup;
  @override
  RestLocationEntity get delivery;
  @override
  RestVehicleModelEntity get vehicleModel;
  @override
  @JsonKey(ignore: true)
  _$$RestLoadEntityImplCopyWith<_$RestLoadEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
