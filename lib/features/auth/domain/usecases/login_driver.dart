import 'package:injectable/injectable.dart';
import 'package:transport_management/features/auth/domain/repository/auth_repository.dart';
import 'package:transport_management/infrastructure/usecase.dart';
import 'package:transport_management/infrastructure/usecase_input.dart';
import 'package:transport_management/infrastructure/usecase_output.dart';

class LoginDriverUsecaseInput extends Input {
  LoginDriverUsecaseInput({
    required this.phone,
    required this.password,
  });

  final String phone;
  final String password;
}

class LoginDriverUsecaseOutput extends Output {
  final String token;

  LoginDriverUsecaseOutput({required this.token});
}

@lazySingleton
class LoginDriverUsecase
    extends Usecase<LoginDriverUsecaseInput, LoginDriverUsecaseOutput> {
  final AuthRepository _authRepository;

  LoginDriverUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<LoginDriverUsecaseOutput> call(LoginDriverUsecaseInput input) async {
    return await _authRepository.login(input);
  }
}
