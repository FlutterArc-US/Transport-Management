import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_expense_types_data_provider.g.dart';

@riverpod
class ReportExpenseTypesData extends _$ReportExpenseTypesData {
  @override
  List<String> build() => [
        'Fuel',
        'Toll',
        'Parking',
        'Repair',
        'Maintenance',
        'Food',
        'Other',
      ];
}
