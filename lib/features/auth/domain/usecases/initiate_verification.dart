import 'package:avcons/features/auth/domain/repository/auth_repository.dart';
import 'package:avcons/infrastructure/usecase.dart';
import 'package:avcons/infrastructure/usecase_input.dart';
import 'package:avcons/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

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
