import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/home/domain/enums/bottom_nav_item.dart';

part 'selected_nav_item_provider.g.dart';

@riverpod
class SelectedNavItem extends _$SelectedNavItem {
  @override
  BottomNavItem build() => BottomNavItem.routeToday;

  @override
  set state(BottomNavItem newState) => super.state = newState;

  BottomNavItem update(BottomNavItem Function(BottomNavItem state) cb) =>
      state = cb(state);
}
