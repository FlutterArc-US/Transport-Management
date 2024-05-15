import 'package:injectable/injectable.dart';
import 'package:transport_management/features/auth/domain/repository/auth_repository.dart';
import 'package:transport_management/infrastructure/usecase.dart';
import 'package:transport_management/infrastructure/usecase_input.dart';
import 'package:transport_management/infrastructure/usecase_output.dart';

class GetAuthUsecaseInput extends Input {
  GetAuthUsecaseInput();
}

class GetAuthUsecaseOutput extends Output {
  GetAuthUsecaseOutput({this.bearerToken});

  final String? bearerToken;
}

@lazySingleton
class GetAuthUsecase
    extends Usecase<GetAuthUsecaseInput, GetAuthUsecaseOutput> {
  final AuthRepository _authRepository;

  GetAuthUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<GetAuthUsecaseOutput> call(GetAuthUsecaseInput input) async {
    return await _authRepository.getAuth(input);
  }
}
