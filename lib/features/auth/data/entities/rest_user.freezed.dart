// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rest_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RestUserEntity _$RestUserEntityFromJson(Map<String, dynamic> json) {
  return _RestUserEntity.fromJson(json);
}

/// @nodoc
mixin _$RestUserEntity {
  String? get company => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get userType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestUserEntityCopyWith<RestUserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestUserEntityCopyWith<$Res> {
  factory $RestUserEntityCopyWith(
          RestUserEntity value, $Res Function(RestUserEntity) then) =
      _$RestUserEntityCopyWithImpl<$Res, RestUserEntity>;
  @useResult
  $Res call(
      {String? company,
      String email,
      String image,
      String name,
      String phone,
      String userType});
}

/// @nodoc
class _$RestUserEntityCopyWithImpl<$Res, $Val extends RestUserEntity>
    implements $RestUserEntityCopyWith<$Res> {
  _$RestUserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? company = freezed,
    Object? email = null,
    Object? image = null,
    Object? name = null,
    Object? phone = null,
    Object? userType = null,
  }) {
    return _then(_value.copyWith(
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestUserEntityImplCopyWith<$Res>
    implements $RestUserEntityCopyWith<$Res> {
  factory _$$RestUserEntityImplCopyWith(_$RestUserEntityImpl value,
          $Res Function(_$RestUserEntityImpl) then) =
      __$$RestUserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? company,
      String email,
      String image,
      String name,
      String phone,
      String userType});
}

/// @nodoc
class __$$RestUserEntityImplCopyWithImpl<$Res>
    extends _$RestUserEntityCopyWithImpl<$Res, _$RestUserEntityImpl>
    implements _$$RestUserEntityImplCopyWith<$Res> {
  __$$RestUserEntityImplCopyWithImpl(
      _$RestUserEntityImpl _value, $Res Function(_$RestUserEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? company = freezed,
    Object? email = null,
    Object? image = null,
    Object? name = null,
    Object? phone = null,
    Object? userType = null,
  }) {
    return _then(_$RestUserEntityImpl(
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestUserEntityImpl implements _RestUserEntity {
  const _$RestUserEntityImpl(
      {required this.company,
      required this.email,
      required this.image,
      required this.name,
      required this.phone,
      required this.userType});

  factory _$RestUserEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestUserEntityImplFromJson(json);

  @override
  final String? company;
  @override
  final String email;
  @override
  final String image;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String userType;

  @override
  String toString() {
    return 'RestUserEntity(company: $company, email: $email, image: $image, name: $name, phone: $phone, userType: $userType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestUserEntityImpl &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.userType, userType) ||
                other.userType == userType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, company, email, image, name, phone, userType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestUserEntityImplCopyWith<_$RestUserEntityImpl> get copyWith =>
      __$$RestUserEntityImplCopyWithImpl<_$RestUserEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestUserEntityImplToJson(
      this,
    );
  }
}

abstract class _RestUserEntity implements RestUserEntity {
  const factory _RestUserEntity(
      {required final String? company,
      required final String email,
      required final String image,
      required final String name,
      required final String phone,
      required final String userType}) = _$RestUserEntityImpl;

  factory _RestUserEntity.fromJson(Map<String, dynamic> json) =
      _$RestUserEntityImpl.fromJson;

  @override
  String? get company;
  @override
  String get email;
  @override
  String get image;
  @override
  String get name;
  @override
  String get phone;
  @override
  String get userType;
  @override
  @JsonKey(ignore: true)
  _$$RestUserEntityImplCopyWith<_$RestUserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
