import 'package:avcons/features/withdrawal/domain/repository/withdrawal_repository.dart';
import 'package:avcons/infrastructure/usecase.dart';
import 'package:avcons/infrastructure/usecase_input.dart';
import 'package:avcons/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class CreateWithdrawalRequestUsecaseInput extends Input {
  CreateWithdrawalRequestUsecaseInput({
    required this.bankName,
    required this.iban,
    required this.sortCode,
    required this.amount,
    required this.accountType,
    required this.bearer,
    required this.accountTitle,
    this.message,
  });

  final String bankName;
  final String iban;
  final String sortCode;
  final int amount;
  final String accountType;
  final String bearer;
  final String accountTitle;
  final String? message;
}

class CreateWithdrawalRequestUsecaseOutput extends Output {
  CreateWithdrawalRequestUsecaseOutput();
}

@lazySingleton
class CreateWithdrawalRequestUsecase extends Usecase<
    CreateWithdrawalRequestUsecaseInput, CreateWithdrawalRequestUsecaseOutput> {
  final WithdrawalRepository _withdrawalRepository;

  CreateWithdrawalRequestUsecase(
      {required WithdrawalRepository withdrawalRepository})
      : _withdrawalRepository = withdrawalRepository;

  @override
  Future<CreateWithdrawalRequestUsecaseOutput> call(
      CreateWithdrawalRequestUsecaseInput input) async {
    return await _withdrawalRepository.createWithdrawalRequest(input);
  }
}
