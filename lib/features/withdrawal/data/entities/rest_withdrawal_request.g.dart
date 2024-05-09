// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_withdrawal_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestWithdrawalRequestEntityImpl _$$RestWithdrawalRequestEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$RestWithdrawalRequestEntityImpl(
      amount: json['amount'] as String,
      iban: json['iban'] as String,
      sortCode: json['sortCode'] as String,
      accountType: json['accountType'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$RestWithdrawalRequestEntityImplToJson(
        _$RestWithdrawalRequestEntityImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'iban': instance.iban,
      'sortCode': instance.sortCode,
      'accountType': instance.accountType,
      'status': instance.status,
    };
