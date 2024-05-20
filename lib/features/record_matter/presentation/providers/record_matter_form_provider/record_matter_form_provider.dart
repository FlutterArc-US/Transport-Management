import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/record_matter/domain/models/record_matter_form/record_matter_form.dart';

part 'record_matter_form_provider.g.dart';

@riverpod
class RecordMatterForm extends _$RecordMatterForm {
  void setType(String value) {
    state = state.copyWith(type: value);
  }

  void setDate(String value) {
    state = state.copyWith(date: value);
  }

  void setMessage(String value) {
    state = state.copyWith(message: value);
  }

  void setAmount(int value) {
    state = state.copyWith(amount: value);
  }

  @override
  RecordMatterFormModel build() {
    return RecordMatterFormModel.initial();
  }
}
