import 'package:transport_management/features/withdrawal/domain/models/withdrawal_form/withdrawal_form_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'withdrawal_form_provider.g.dart';

@riverpod
class WithdrawalForm extends _$WithdrawalForm {
  void setAmount(int value) {
    state = state.copyWith(amount: value);
  }

  void setBankName(String value) {
    state = state.copyWith(bankName: value);
  }

  void setIban(String value) {
    state = state.copyWith(iban: value);
  }

  void setSortCode(String value) {
    state = state.copyWith(sortCode: value);
  }

  void setAccountType(String value) {
    state = state.copyWith(accountType: value);
  }

  void setAccountTitle(String value) {
    state = state.copyWith(accountTitle: value);
  }

  void setMessage(String value) {
    state = state.copyWith(message: value);
  }

  @override
  WithdrawalFormModel build() {
    return WithdrawalFormModel();
  }
}
