// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rest_vehicle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RestVehicleModelEntity _$RestVehicleModelEntityFromJson(
    Map<String, dynamic> json) {
  return _RestVehicleModelEntity.fromJson(json);
}

/// @nodoc
mixin _$RestVehicleModelEntity {
  int get id => throw _privateConstructorUsedError;
  String get img => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestVehicleModelEntityCopyWith<RestVehicleModelEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestVehicleModelEntityCopyWith<$Res> {
  factory $RestVehicleModelEntityCopyWith(RestVehicleModelEntity value,
          $Res Function(RestVehicleModelEntity) then) =
      _$RestVehicleModelEntityCopyWithImpl<$Res, RestVehicleModelEntity>;
  @useResult
  $Res call({int id, String img, String name});
}

/// @nodoc
class _$RestVehicleModelEntityCopyWithImpl<$Res,
        $Val extends RestVehicleModelEntity>
    implements $RestVehicleModelEntityCopyWith<$Res> {
  _$RestVehicleModelEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? img = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      img: null == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestVehicleModelEntityImplCopyWith<$Res>
    implements $RestVehicleModelEntityCopyWith<$Res> {
  factory _$$RestVehicleModelEntityImplCopyWith(
          _$RestVehicleModelEntityImpl value,
          $Res Function(_$RestVehicleModelEntityImpl) then) =
      __$$RestVehicleModelEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String img, String name});
}

/// @nodoc
class __$$RestVehicleModelEntityImplCopyWithImpl<$Res>
    extends _$RestVehicleModelEntityCopyWithImpl<$Res,
        _$RestVehicleModelEntityImpl>
    implements _$$RestVehicleModelEntityImplCopyWith<$Res> {
  __$$RestVehicleModelEntityImplCopyWithImpl(
      _$RestVehicleModelEntityImpl _value,
      $Res Function(_$RestVehicleModelEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? img = null,
    Object? name = null,
  }) {
    return _then(_$RestVehicleModelEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      img: null == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestVehicleModelEntityImpl implements _RestVehicleModelEntity {
  const _$RestVehicleModelEntityImpl(
      {required this.id, required this.img, required this.name});

  factory _$RestVehicleModelEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestVehicleModelEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String img;
  @override
  final String name;

  @override
  String toString() {
    return 'RestVehicleModelEntity(id: $id, img: $img, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestVehicleModelEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.img, img) || other.img == img) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, img, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestVehicleModelEntityImplCopyWith<_$RestVehicleModelEntityImpl>
      get copyWith => __$$RestVehicleModelEntityImplCopyWithImpl<
          _$RestVehicleModelEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestVehicleModelEntityImplToJson(
      this,
    );
  }
}

abstract class _RestVehicleModelEntity implements RestVehicleModelEntity {
  const factory _RestVehicleModelEntity(
      {required final int id,
      required final String img,
      required final String name}) = _$RestVehicleModelEntityImpl;

  factory _RestVehicleModelEntity.fromJson(Map<String, dynamic> json) =
      _$RestVehicleModelEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get img;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$RestVehicleModelEntityImplCopyWith<_$RestVehicleModelEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
