import 'package:transport_management/features/withdrawal/domain/models/withdrawal_request/withdrawal_request_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_withdrawal_request.freezed.dart';
part 'rest_withdrawal_request.g.dart';

@freezed
class RestWithdrawalRequestEntity extends WithdrawalRequestEntity
    with _$RestWithdrawalRequestEntity {
  const factory RestWithdrawalRequestEntity({
    required String amount,
    required String iban,
    required String sortCode,
    required String accountType,
    required String status,
  }) = _RestWithdrawalRequestEntity;

  factory RestWithdrawalRequestEntity.fromJson(Map<String, Object?> json) =>
      _$RestWithdrawalRequestEntityFromJson(json);
}
