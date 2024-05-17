import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_ride_provider.g.dart';

@riverpod
class SelectedRide extends _$SelectedRide {
  @override
  int build() => 0;

  @override
  set state(int newState) => super.state = newState;
}
