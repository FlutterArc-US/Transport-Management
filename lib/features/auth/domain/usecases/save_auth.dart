import 'package:injectable/injectable.dart';
import 'package:transport_management/features/auth/domain/repository/auth_repository.dart';
import 'package:transport_management/infrastructure/usecase.dart';
import 'package:transport_management/infrastructure/usecase_input.dart';
import 'package:transport_management/infrastructure/usecase_output.dart';

class SaveAuthUsecaseInput extends Input {
  SaveAuthUsecaseInput({this.bearerToken});

  final String? bearerToken;
}

class SaveAuthUsecaseOutput extends Output {
  SaveAuthUsecaseOutput();
}

@lazySingleton
class SaveAuthUsecase
    extends Usecase<SaveAuthUsecaseInput, SaveAuthUsecaseOutput> {
  final AuthRepository _authRepository;

  SaveAuthUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<SaveAuthUsecaseOutput> call(SaveAuthUsecaseInput input) async {
    return await _authRepository.saveAuth(input);
  }
}
