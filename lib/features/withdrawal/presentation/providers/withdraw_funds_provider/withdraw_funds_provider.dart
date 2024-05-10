import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/auth/presentation/providers/bearer_provider/bearer_provider.dart';
import 'package:transport_management/features/withdrawal/domain/usecases/create_withdrawal_request.dart';
import 'package:transport_management/features/withdrawal/presentation/providers/withdrawal_form_provider/withdrawal_form_provider.dart';
import 'package:transport_management/util/di/di.dart';

part 'withdraw_funds_provider.g.dart';

@riverpod
Future<void> withdrawFunds(WithdrawFundsRef ref) async {
  final createRequest = sl<CreateWithdrawalRequestUsecase>();
  final bearer = await ref.read(bearerTokenProvider.future);
  final withdrawalForm = ref.read(withdrawalFormProvider);

  final input = CreateWithdrawalRequestUsecaseInput(
    bearer: bearer!,
    bankName: withdrawalForm.bankName!,
    iban: withdrawalForm.iban!,
    sortCode: withdrawalForm.sortCode!,
    amount: withdrawalForm.amount!,
    accountType: withdrawalForm.accountType!,
    accountTitle: withdrawalForm.accountTitle!,
    message: withdrawalForm.message,
  );

  await createRequest(input);
}
