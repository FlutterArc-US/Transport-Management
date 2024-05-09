import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submitted_docs_provider.g.dart';

@riverpod
class SubmittedDocs extends _$SubmittedDocs {
  @override
  List<String> build() {
    return [];
  }

  void update(String data) {
    if (state.contains(data)) {
      remove(data);
    } else {
      add(data);
    }
  }

  void add(String data) {
    state = [
      ...state,
      data,
    ];
  }

  void addMultiple(List<String> data) {
    state = [
      ...state,
      ...data,
    ];
  }

  void remove(String data) {
    state = state.where((e) => e != data).toList();
  }

  void removeMultiple(List<String> data) {
    state = state.where((e) => !data.contains(e)).toList();
  }

  void clear() {
    state = [];
  }
}
