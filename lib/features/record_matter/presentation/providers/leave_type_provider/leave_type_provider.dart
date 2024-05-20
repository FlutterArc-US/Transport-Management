import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/home/domain/enums/leave_type.dart';

part 'leave_type_provider.g.dart';

@riverpod
class LeaveType extends _$LeaveType {
  @override
  LeaveTypeModel build() => LeaveTypeModel.single;

  @override
  set state(LeaveTypeModel newState) => super.state = newState;
}
