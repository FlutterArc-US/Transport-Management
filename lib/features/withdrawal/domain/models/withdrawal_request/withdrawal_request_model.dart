import 'package:avcons/features/withdrawal/domain/models/withdrawal_request/withdrawal_request_entity.dart';

class WithdrawalRequestModel {
  final String amount;
  final String accountType;
  final String sortCode;
  final String iban;
  final String status;

  WithdrawalRequestModel({
    required this.amount,
    required this.accountType,
    required this.iban,
    required this.sortCode,
    required this.status,
  });

  factory WithdrawalRequestModel.fromEntity(WithdrawalRequestEntity entity) {
    return WithdrawalRequestModel(
      amount: entity.amount,
      accountType: entity.accountType,
      sortCode: entity.sortCode,
      iban: entity.iban,
      status: entity.status,
    );
  }
}
