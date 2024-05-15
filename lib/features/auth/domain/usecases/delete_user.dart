import 'package:injectable/injectable.dart';
import 'package:transport_management/features/auth/domain/repository/auth_repository.dart';
import 'package:transport_management/infrastructure/usecase.dart';
import 'package:transport_management/infrastructure/usecase_input.dart';
import 'package:transport_management/infrastructure/usecase_output.dart';

class DeleteUserUsecaseInput extends Input {
  DeleteUserUsecaseInput({
    required this.bearer,
  });

  final String bearer;
}

class DeleteUserUsecaseOutput extends Output {
  DeleteUserUsecaseOutput();
}

@lazySingleton
class DeleteUserUsecase
    extends Usecase<DeleteUserUsecaseInput, DeleteUserUsecaseOutput> {
  final AuthRepository _authRepository;

  DeleteUserUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<DeleteUserUsecaseOutput> call(DeleteUserUsecaseInput input) async {
    return await _authRepository.deleteUser(input);
  }
}
