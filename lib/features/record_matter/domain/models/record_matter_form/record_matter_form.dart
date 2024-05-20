class RecordMatterFormModel {
  final String? type;
  final String? date;
  final String? message;
  final num? amount;

  RecordMatterFormModel({
    this.type,
    this.date,
    this.message,
    this.amount,
  });

  factory RecordMatterFormModel.initial() {
    return RecordMatterFormModel();
  }

  RecordMatterFormModel copyWith({
    String? type,
    String? date,
    String? message,
    int? amount,
  }) {
    return RecordMatterFormModel(
      type: type ?? this.type,
      date: date ?? this.date,
      message: message ?? this.message,
      amount: amount ?? this.amount,
    );
  }
}
