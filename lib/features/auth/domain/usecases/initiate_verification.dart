import 'package:injectable/injectable.dart';
import 'package:transport_management/features/auth/domain/repository/auth_repository.dart';
import 'package:transport_management/infrastructure/usecase.dart';
import 'package:transport_management/infrastructure/usecase_input.dart';
import 'package:transport_management/infrastructure/usecase_output.dart';

class InitiateVerificationUsecaseInput extends Input {
  InitiateVerificationUsecaseInput({required this.phone});

  final String phone;
}

class InitiateVerificationUsecaseOutput extends Output {
  InitiateVerificationUsecaseOutput();
}

@lazySingleton
class InitiateVerificationUsecase extends Usecase<
    InitiateVerificationUsecaseInput, InitiateVerificationUsecaseOutput> {
  final AuthRepository _authRepository;

  InitiateVerificationUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<InitiateVerificationUsecaseOutput> call(
      InitiateVerificationUsecaseInput input) async {
    return await _authRepository.initiateVerification(input);
  }
}
