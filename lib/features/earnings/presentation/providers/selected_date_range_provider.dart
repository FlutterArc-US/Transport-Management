import 'package:transport_management/features/earnings/domain/models/date_range/date_range_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

part 'selected_date_range_provider.g.dart';

@riverpod
class SelectedDateRange extends _$SelectedDateRange {
  @override
  DateRangeModel build() {
    return DateRangeModel(
      initial: DateTime.now().subtract(const Duration(days: 182)),
      closing: DateTime.now(),
    );
  }

  PickerDateRange? holdPickedRange;

  void setDate() {
    state = state.copyWith(
      initial: holdPickedRange?.startDate,
      closing: holdPickedRange?.endDate,
    );
  }
}
