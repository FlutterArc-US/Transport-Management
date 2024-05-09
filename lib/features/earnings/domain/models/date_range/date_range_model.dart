class DateRangeModel {
  DateRangeModel({
    this.initial,
    this.closing,
  });

  final DateTime? initial;
  final DateTime? closing;

  DateRangeModel copyWith({DateTime? initial, DateTime? closing}) {
    return DateRangeModel(
      initial: initial ?? this.initial,
      closing: closing ?? this.closing,
    );
  }
}
