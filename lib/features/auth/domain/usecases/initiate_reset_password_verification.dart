import 'package:injectable/injectable.dart';
import 'package:transport_management/features/auth/domain/repository/auth_repository.dart';
import 'package:transport_management/infrastructure/usecase.dart';
import 'package:transport_management/infrastructure/usecase_input.dart';
import 'package:transport_management/infrastructure/usecase_output.dart';

class InitiateResetPasswordVerificationUsecaseInput extends Input {
  InitiateResetPasswordVerificationUsecaseInput({
    required this.phone,
  });

  final String phone;
}

class InitiateResetPasswordVerificationUsecaseOutput extends Output {
  InitiateResetPasswordVerificationUsecaseOutput();
}

@lazySingleton
class InitiateResetPasswordVerificationUsecase extends Usecase<
    InitiateResetPasswordVerificationUsecaseInput,
    InitiateResetPasswordVerificationUsecaseOutput> {
  final AuthRepository _authRepository;

  InitiateResetPasswordVerificationUsecase(
      {required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<InitiateResetPasswordVerificationUsecaseOutput> call(
      InitiateResetPasswordVerificationUsecaseInput input) async {
    return await _authRepository.resetPasswordInitiateVerification(input);
  }
}
