import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboard_page_provider.g.dart';

@riverpod
class OnboardPageNumber extends _$OnboardPageNumber {
  @override
  int build() {
    return 1;
  }

  void next() {
    if (state < 3) {
      state = state + 1;
    }
  }

  void prev() {
    if (state > 2) {
      state = state - 1;
    }
  }

  @override
  set state(int value) {
    super.state = value;
  }
}
