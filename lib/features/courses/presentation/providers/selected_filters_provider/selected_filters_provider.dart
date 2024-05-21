import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_filters_provider.g.dart';

@riverpod
class SelectedFilters extends _$SelectedFilters {
  @override
  List<int> build() {
    return [];
  }

  void update(int data) {
    if (state.contains(data)) {
      remove(data);
    } else {
      add(data);
    }
  }

  void add(int data) {
    state = [
      ...state,
      data,
    ];
  }

  void remove(int data) {
    state = state.where((e) => e != data).toList();
  }

  void clear() {
    state = [];
  }
}
