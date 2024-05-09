// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rest_driver.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RestDriverEntity _$RestDriverEntityFromJson(Map<String, dynamic> json) {
  return _RestDriverEntity.fromJson(json);
}

/// @nodoc
mixin _$RestDriverEntity {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get licenseNo => throw _privateConstructorUsedError;
  RestVehicleEntity? get vehicle => throw _privateConstructorUsedError;
  int? get fleetId => throw _privateConstructorUsedError;
  String? get img => throw _privateConstructorUsedError;
  String? get phonePrefix => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestDriverEntityCopyWith<RestDriverEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestDriverEntityCopyWith<$Res> {
  factory $RestDriverEntityCopyWith(
          RestDriverEntity value, $Res Function(RestDriverEntity) then) =
      _$RestDriverEntityCopyWithImpl<$Res, RestDriverEntity>;
  @useResult
  $Res call(
      {int id,
      String email,
      String name,
      String phone,
      String type,
      String status,
      String? licenseNo,
      RestVehicleEntity? vehicle,
      int? fleetId,
      String? img,
      String? phonePrefix});

  $RestVehicleEntityCopyWith<$Res>? get vehicle;
}

/// @nodoc
class _$RestDriverEntityCopyWithImpl<$Res, $Val extends RestDriverEntity>
    implements $RestDriverEntityCopyWith<$Res> {
  _$RestDriverEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? phone = null,
    Object? type = null,
    Object? status = null,
    Object? licenseNo = freezed,
    Object? vehicle = freezed,
    Object? fleetId = freezed,
    Object? img = freezed,
    Object? phonePrefix = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNo: freezed == licenseNo
          ? _value.licenseNo
          : licenseNo // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicle: freezed == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as RestVehicleEntity?,
      fleetId: freezed == fleetId
          ? _value.fleetId
          : fleetId // ignore: cast_nullable_to_non_nullable
              as int?,
      img: freezed == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      phonePrefix: freezed == phonePrefix
          ? _value.phonePrefix
          : phonePrefix // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RestVehicleEntityCopyWith<$Res>? get vehicle {
    if (_value.vehicle == null) {
      return null;
    }

    return $RestVehicleEntityCopyWith<$Res>(_value.vehicle!, (value) {
      return _then(_value.copyWith(vehicle: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RestDriverEntityImplCopyWith<$Res>
    implements $RestDriverEntityCopyWith<$Res> {
  factory _$$RestDriverEntityImplCopyWith(_$RestDriverEntityImpl value,
          $Res Function(_$RestDriverEntityImpl) then) =
      __$$RestDriverEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String email,
      String name,
      String phone,
      String type,
      String status,
      String? licenseNo,
      RestVehicleEntity? vehicle,
      int? fleetId,
      String? img,
      String? phonePrefix});

  @override
  $RestVehicleEntityCopyWith<$Res>? get vehicle;
}

/// @nodoc
class __$$RestDriverEntityImplCopyWithImpl<$Res>
    extends _$RestDriverEntityCopyWithImpl<$Res, _$RestDriverEntityImpl>
    implements _$$RestDriverEntityImplCopyWith<$Res> {
  __$$RestDriverEntityImplCopyWithImpl(_$RestDriverEntityImpl _value,
      $Res Function(_$RestDriverEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? phone = null,
    Object? type = null,
    Object? status = null,
    Object? licenseNo = freezed,
    Object? vehicle = freezed,
    Object? fleetId = freezed,
    Object? img = freezed,
    Object? phonePrefix = freezed,
  }) {
    return _then(_$RestDriverEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      licenseNo: freezed == licenseNo
          ? _value.licenseNo
          : licenseNo // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicle: freezed == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as RestVehicleEntity?,
      fleetId: freezed == fleetId
          ? _value.fleetId
          : fleetId // ignore: cast_nullable_to_non_nullable
              as int?,
      img: freezed == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      phonePrefix: freezed == phonePrefix
          ? _value.phonePrefix
          : phonePrefix // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestDriverEntityImpl implements _RestDriverEntity {
  const _$RestDriverEntityImpl(
      {required this.id,
      required this.email,
      required this.name,
      required this.phone,
      required this.type,
      required this.status,
      required this.licenseNo,
      required this.vehicle,
      required this.fleetId,
      required this.img,
      required this.phonePrefix});

  factory _$RestDriverEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestDriverEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String type;
  @override
  final String status;
  @override
  final String? licenseNo;
  @override
  final RestVehicleEntity? vehicle;
  @override
  final int? fleetId;
  @override
  final String? img;
  @override
  final String? phonePrefix;

  @override
  String toString() {
    return 'RestDriverEntity(id: $id, email: $email, name: $name, phone: $phone, type: $type, status: $status, licenseNo: $licenseNo, vehicle: $vehicle, fleetId: $fleetId, img: $img, phonePrefix: $phonePrefix)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestDriverEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.licenseNo, licenseNo) ||
                other.licenseNo == licenseNo) &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle) &&
            (identical(other.fleetId, fleetId) || other.fleetId == fleetId) &&
            (identical(other.img, img) || other.img == img) &&
            (identical(other.phonePrefix, phonePrefix) ||
                other.phonePrefix == phonePrefix));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, name, phone, type,
      status, licenseNo, vehicle, fleetId, img, phonePrefix);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestDriverEntityImplCopyWith<_$RestDriverEntityImpl> get copyWith =>
      __$$RestDriverEntityImplCopyWithImpl<_$RestDriverEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestDriverEntityImplToJson(
      this,
    );
  }
}

abstract class _RestDriverEntity implements RestDriverEntity {
  const factory _RestDriverEntity(
      {required final int id,
      required final String email,
      required final String name,
      required final String phone,
      required final String type,
      required final String status,
      required final String? licenseNo,
      required final RestVehicleEntity? vehicle,
      required final int? fleetId,
      required final String? img,
      required final String? phonePrefix}) = _$RestDriverEntityImpl;

  factory _RestDriverEntity.fromJson(Map<String, dynamic> json) =
      _$RestDriverEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  String get name;
  @override
  String get phone;
  @override
  String get type;
  @override
  String get status;
  @override
  String? get licenseNo;
  @override
  RestVehicleEntity? get vehicle;
  @override
  int? get fleetId;
  @override
  String? get img;
  @override
  String? get phonePrefix;
  @override
  @JsonKey(ignore: true)
  _$$RestDriverEntityImplCopyWith<_$RestDriverEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
