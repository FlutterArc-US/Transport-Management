import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/record_matter/domain/models/leave/leave_model.dart';

part 'selected_leaves_provider.g.dart';

@riverpod
class SelectedLeaves extends _$SelectedLeaves {
  @override
  List<LeaveModel> build() {
    return [];
  }

  @override
  set state(List<LeaveModel> newState) => super.state = newState;

  void updateMulti(LeaveModel data) {
    if (state.contains(data)) {
      state = state.where((e) => e != data).toList();
    } else {
      state = [
        ...state,
        data,
      ];
    }
  }

  void updateSingle(LeaveModel data) {
    state = [data];
  }

  void reset() {
    state = [];
  }
}
