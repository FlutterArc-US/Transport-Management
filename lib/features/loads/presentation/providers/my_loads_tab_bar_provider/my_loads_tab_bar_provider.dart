import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/loads/domain/enums/my_loads_tab/my_loads_tab.dart';

part 'my_loads_tab_bar_provider.g.dart';

@riverpod
class SelectedMyLoadsTab extends _$SelectedMyLoadsTab {
  @override
  MyLoadsTabModel build() => MyLoadsTabModel.booked;

  @override
  set state(MyLoadsTabModel newState) => super.state = newState;

  MyLoadsTabModel update(MyLoadsTabModel Function(MyLoadsTabModel state) cb) =>
      state = cb(state);
}
