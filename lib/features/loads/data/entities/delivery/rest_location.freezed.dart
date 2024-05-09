// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rest_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RestLocationEntity _$RestLocationEntityFromJson(Map<String, dynamic> json) {
  return _RestLocationEntity.fromJson(json);
}

/// @nodoc
mixin _$RestLocationEntity {
  int get id => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  num get lat => throw _privateConstructorUsedError;
  num get lng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestLocationEntityCopyWith<RestLocationEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestLocationEntityCopyWith<$Res> {
  factory $RestLocationEntityCopyWith(
          RestLocationEntity value, $Res Function(RestLocationEntity) then) =
      _$RestLocationEntityCopyWithImpl<$Res, RestLocationEntity>;
  @useResult
  $Res call({int id, String address, num lat, num lng});
}

/// @nodoc
class _$RestLocationEntityCopyWithImpl<$Res, $Val extends RestLocationEntity>
    implements $RestLocationEntityCopyWith<$Res> {
  _$RestLocationEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? address = null,
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as num,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestLocationEntityImplCopyWith<$Res>
    implements $RestLocationEntityCopyWith<$Res> {
  factory _$$RestLocationEntityImplCopyWith(_$RestLocationEntityImpl value,
          $Res Function(_$RestLocationEntityImpl) then) =
      __$$RestLocationEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String address, num lat, num lng});
}

/// @nodoc
class __$$RestLocationEntityImplCopyWithImpl<$Res>
    extends _$RestLocationEntityCopyWithImpl<$Res, _$RestLocationEntityImpl>
    implements _$$RestLocationEntityImplCopyWith<$Res> {
  __$$RestLocationEntityImplCopyWithImpl(_$RestLocationEntityImpl _value,
      $Res Function(_$RestLocationEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? address = null,
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$RestLocationEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as num,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestLocationEntityImpl implements _RestLocationEntity {
  const _$RestLocationEntityImpl(
      {required this.id,
      required this.address,
      required this.lat,
      required this.lng});

  factory _$RestLocationEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestLocationEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String address;
  @override
  final num lat;
  @override
  final num lng;

  @override
  String toString() {
    return 'RestLocationEntity(id: $id, address: $address, lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestLocationEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, address, lat, lng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestLocationEntityImplCopyWith<_$RestLocationEntityImpl> get copyWith =>
      __$$RestLocationEntityImplCopyWithImpl<_$RestLocationEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestLocationEntityImplToJson(
      this,
    );
  }
}

abstract class _RestLocationEntity implements RestLocationEntity {
  const factory _RestLocationEntity(
      {required final int id,
      required final String address,
      required final num lat,
      required final num lng}) = _$RestLocationEntityImpl;

  factory _RestLocationEntity.fromJson(Map<String, dynamic> json) =
      _$RestLocationEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get address;
  @override
  num get lat;
  @override
  num get lng;
  @override
  @JsonKey(ignore: true)
  _$$RestLocationEntityImplCopyWith<_$RestLocationEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
