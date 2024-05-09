import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language_provider.g.dart';

@riverpod
class AppLanguage extends _$AppLanguage {
  @override
  String build() {
    return 'en';
  }

  void toggle() {
    if (state == 'en') {
      state = 'gr';
    } else {
      state = 'en';
    }
  }
}
