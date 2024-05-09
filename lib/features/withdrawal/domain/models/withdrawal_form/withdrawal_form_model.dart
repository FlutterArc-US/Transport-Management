class WithdrawalFormModel {
  final int? amount;
  final String? bankName;
  final String? accountTitle;
  final String? iban;
  final String? sortCode;
  final String? accountType;
  final String? message;

  WithdrawalFormModel({
    this.amount,
    this.bankName,
    this.accountType,
    this.sortCode,
    this.iban,
    this.accountTitle,
    this.message,
  });

  WithdrawalFormModel copyWith({
    int? amount,
    String? bankName,
    String? accountType,
    String? sortCode,
    String? iban,
    String? accountTitle,
    String? message,
  }) {
    return WithdrawalFormModel(
      amount: amount ?? this.amount,
      bankName: bankName ?? this.bankName,
      accountType: accountType ?? this.accountType,
      iban: iban ?? this.iban,
      sortCode: sortCode ?? this.sortCode,
      accountTitle: accountTitle ?? this.accountTitle,
      message: message ?? this.message,
    );
  }
}
