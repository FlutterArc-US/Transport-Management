import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/rides/domain/enums/sorting_preference/sorting_preference.dart';

part 'sort_preference_provider.g.dart';

@riverpod
class SortingPreference extends _$SortingPreference {
  @override
  SortingPreferenceModel build() => SortingPreferenceModel.price;

  @override
  set state(SortingPreferenceModel newState) => super.state = newState;

  SortingPreferenceModel update(
          SortingPreferenceModel Function(SortingPreferenceModel state) cb) =>
      state = cb(state);
}
