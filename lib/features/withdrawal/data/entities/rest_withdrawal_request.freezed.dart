// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rest_withdrawal_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RestWithdrawalRequestEntity _$RestWithdrawalRequestEntityFromJson(
    Map<String, dynamic> json) {
  return _RestWithdrawalRequestEntity.fromJson(json);
}

/// @nodoc
mixin _$RestWithdrawalRequestEntity {
  String get amount => throw _privateConstructorUsedError;
  String get iban => throw _privateConstructorUsedError;
  String get sortCode => throw _privateConstructorUsedError;
  String get accountType => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestWithdrawalRequestEntityCopyWith<RestWithdrawalRequestEntity>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestWithdrawalRequestEntityCopyWith<$Res> {
  factory $RestWithdrawalRequestEntityCopyWith(
          RestWithdrawalRequestEntity value,
          $Res Function(RestWithdrawalRequestEntity) then) =
      _$RestWithdrawalRequestEntityCopyWithImpl<$Res,
          RestWithdrawalRequestEntity>;
  @useResult
  $Res call(
      {String amount,
      String iban,
      String sortCode,
      String accountType,
      String status});
}

/// @nodoc
class _$RestWithdrawalRequestEntityCopyWithImpl<$Res,
        $Val extends RestWithdrawalRequestEntity>
    implements $RestWithdrawalRequestEntityCopyWith<$Res> {
  _$RestWithdrawalRequestEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? iban = null,
    Object? sortCode = null,
    Object? accountType = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      iban: null == iban
          ? _value.iban
          : iban // ignore: cast_nullable_to_non_nullable
              as String,
      sortCode: null == sortCode
          ? _value.sortCode
          : sortCode // ignore: cast_nullable_to_non_nullable
              as String,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestWithdrawalRequestEntityImplCopyWith<$Res>
    implements $RestWithdrawalRequestEntityCopyWith<$Res> {
  factory _$$RestWithdrawalRequestEntityImplCopyWith(
          _$RestWithdrawalRequestEntityImpl value,
          $Res Function(_$RestWithdrawalRequestEntityImpl) then) =
      __$$RestWithdrawalRequestEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String amount,
      String iban,
      String sortCode,
      String accountType,
      String status});
}

/// @nodoc
class __$$RestWithdrawalRequestEntityImplCopyWithImpl<$Res>
    extends _$RestWithdrawalRequestEntityCopyWithImpl<$Res,
        _$RestWithdrawalRequestEntityImpl>
    implements _$$RestWithdrawalRequestEntityImplCopyWith<$Res> {
  __$$RestWithdrawalRequestEntityImplCopyWithImpl(
      _$RestWithdrawalRequestEntityImpl _value,
      $Res Function(_$RestWithdrawalRequestEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? iban = null,
    Object? sortCode = null,
    Object? accountType = null,
    Object? status = null,
  }) {
    return _then(_$RestWithdrawalRequestEntityImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      iban: null == iban
          ? _value.iban
          : iban // ignore: cast_nullable_to_non_nullable
              as String,
      sortCode: null == sortCode
          ? _value.sortCode
          : sortCode // ignore: cast_nullable_to_non_nullable
              as String,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestWithdrawalRequestEntityImpl
    implements _RestWithdrawalRequestEntity {
  const _$RestWithdrawalRequestEntityImpl(
      {required this.amount,
      required this.iban,
      required this.sortCode,
      required this.accountType,
      required this.status});

  factory _$RestWithdrawalRequestEntityImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RestWithdrawalRequestEntityImplFromJson(json);

  @override
  final String amount;
  @override
  final String iban;
  @override
  final String sortCode;
  @override
  final String accountType;
  @override
  final String status;

  @override
  String toString() {
    return 'RestWithdrawalRequestEntity(amount: $amount, iban: $iban, sortCode: $sortCode, accountType: $accountType, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestWithdrawalRequestEntityImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.iban, iban) || other.iban == iban) &&
            (identical(other.sortCode, sortCode) ||
                other.sortCode == sortCode) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, amount, iban, sortCode, accountType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestWithdrawalRequestEntityImplCopyWith<_$RestWithdrawalRequestEntityImpl>
      get copyWith => __$$RestWithdrawalRequestEntityImplCopyWithImpl<
          _$RestWithdrawalRequestEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestWithdrawalRequestEntityImplToJson(
      this,
    );
  }
}

abstract class _RestWithdrawalRequestEntity
    implements RestWithdrawalRequestEntity {
  const factory _RestWithdrawalRequestEntity(
      {required final String amount,
      required final String iban,
      required final String sortCode,
      required final String accountType,
      required final String status}) = _$RestWithdrawalRequestEntityImpl;

  factory _RestWithdrawalRequestEntity.fromJson(Map<String, dynamic> json) =
      _$RestWithdrawalRequestEntityImpl.fromJson;

  @override
  String get amount;
  @override
  String get iban;
  @override
  String get sortCode;
  @override
  String get accountType;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$RestWithdrawalRequestEntityImplCopyWith<_$RestWithdrawalRequestEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
