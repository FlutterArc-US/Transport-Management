import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'uploaded_attachments_provider.g.dart';

@riverpod
class UploadedAttachments extends _$UploadedAttachments {
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
