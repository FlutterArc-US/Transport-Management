abstract class WithdrawalRequestEntity {
  final String amount;
  final String accountType;
  final String sortCode;
  final String iban;
  final String status;

  WithdrawalRequestEntity({
    required this.amount,
    required this.accountType,
    required this.iban,
    required this.sortCode,
    required this.status,
  });
}
