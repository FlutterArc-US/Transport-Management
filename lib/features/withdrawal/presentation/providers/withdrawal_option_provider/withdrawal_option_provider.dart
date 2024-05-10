import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/withdrawal/domain/enums/withdrawal_option.dart';

part 'withdrawal_option_provider.g.dart';

@riverpod
class WithdrawalOptionNotifier extends _$WithdrawalOptionNotifier {
  @override
  WithdrawalOption build() => WithdrawalOption.availableBalance;

  @override
  set state(WithdrawalOption newState) => super.state = newState;

  WithdrawalOption update(
          WithdrawalOption Function(WithdrawalOption state) cb) =>
      state = cb(state);
}
