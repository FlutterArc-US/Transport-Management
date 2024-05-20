import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/home/domain/enums/report_option.dart';

part 'report_option_provider.g.dart';

@riverpod
class ReportOption extends _$ReportOption {
  @override
  ReportOptionModel build() => ReportOptionModel.reportFault;

  @override
  set state(ReportOptionModel newState) => super.state = newState;
}
