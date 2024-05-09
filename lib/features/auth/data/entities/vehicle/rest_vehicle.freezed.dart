// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rest_vehicle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RestVehicleEntity _$RestVehicleEntityFromJson(Map<String, dynamic> json) {
  return _RestVehicleEntity.fromJson(json);
}

/// @nodoc
mixin _$RestVehicleEntity {
  int get id => throw _privateConstructorUsedError;
  RestVehicleModelEntity get model => throw _privateConstructorUsedError;
  String get vehicleLicenseNo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestVehicleEntityCopyWith<RestVehicleEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestVehicleEntityCopyWith<$Res> {
  factory $RestVehicleEntityCopyWith(
          RestVehicleEntity value, $Res Function(RestVehicleEntity) then) =
      _$RestVehicleEntityCopyWithImpl<$Res, RestVehicleEntity>;
  @useResult
  $Res call({int id, RestVehicleModelEntity model, String vehicleLicenseNo});

  $RestVehicleModelEntityCopyWith<$Res> get model;
}

/// @nodoc
class _$RestVehicleEntityCopyWithImpl<$Res, $Val extends RestVehicleEntity>
    implements $RestVehicleEntityCopyWith<$Res> {
  _$RestVehicleEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? model = null,
    Object? vehicleLicenseNo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as RestVehicleModelEntity,
      vehicleLicenseNo: null == vehicleLicenseNo
          ? _value.vehicleLicenseNo
          : vehicleLicenseNo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RestVehicleModelEntityCopyWith<$Res> get model {
    return $RestVehicleModelEntityCopyWith<$Res>(_value.model, (value) {
      return _then(_value.copyWith(model: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RestVehicleEntityImplCopyWith<$Res>
    implements $RestVehicleEntityCopyWith<$Res> {
  factory _$$RestVehicleEntityImplCopyWith(_$RestVehicleEntityImpl value,
          $Res Function(_$RestVehicleEntityImpl) then) =
      __$$RestVehicleEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, RestVehicleModelEntity model, String vehicleLicenseNo});

  @override
  $RestVehicleModelEntityCopyWith<$Res> get model;
}

/// @nodoc
class __$$RestVehicleEntityImplCopyWithImpl<$Res>
    extends _$RestVehicleEntityCopyWithImpl<$Res, _$RestVehicleEntityImpl>
    implements _$$RestVehicleEntityImplCopyWith<$Res> {
  __$$RestVehicleEntityImplCopyWithImpl(_$RestVehicleEntityImpl _value,
      $Res Function(_$RestVehicleEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? model = null,
    Object? vehicleLicenseNo = null,
  }) {
    return _then(_$RestVehicleEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as RestVehicleModelEntity,
      vehicleLicenseNo: null == vehicleLicenseNo
          ? _value.vehicleLicenseNo
          : vehicleLicenseNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestVehicleEntityImpl implements _RestVehicleEntity {
  const _$RestVehicleEntityImpl(
      {required this.id, required this.model, required this.vehicleLicenseNo});

  factory _$RestVehicleEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestVehicleEntityImplFromJson(json);

  @override
  final int id;
  @override
  final RestVehicleModelEntity model;
  @override
  final String vehicleLicenseNo;

  @override
  String toString() {
    return 'RestVehicleEntity(id: $id, model: $model, vehicleLicenseNo: $vehicleLicenseNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestVehicleEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.vehicleLicenseNo, vehicleLicenseNo) ||
                other.vehicleLicenseNo == vehicleLicenseNo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, model, vehicleLicenseNo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestVehicleEntityImplCopyWith<_$RestVehicleEntityImpl> get copyWith =>
      __$$RestVehicleEntityImplCopyWithImpl<_$RestVehicleEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestVehicleEntityImplToJson(
      this,
    );
  }
}

abstract class _RestVehicleEntity implements RestVehicleEntity {
  const factory _RestVehicleEntity(
      {required final int id,
      required final RestVehicleModelEntity model,
      required final String vehicleLicenseNo}) = _$RestVehicleEntityImpl;

  factory _RestVehicleEntity.fromJson(Map<String, dynamic> json) =
      _$RestVehicleEntityImpl.fromJson;

  @override
  int get id;
  @override
  RestVehicleModelEntity get model;
  @override
  String get vehicleLicenseNo;
  @override
  @JsonKey(ignore: true)
  _$$RestVehicleEntityImplCopyWith<_$RestVehicleEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
