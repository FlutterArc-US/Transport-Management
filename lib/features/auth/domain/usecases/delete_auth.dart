import 'package:injectable/injectable.dart';
import 'package:transport_management/features/auth/domain/repository/auth_repository.dart';
import 'package:transport_management/infrastructure/usecase.dart';
import 'package:transport_management/infrastructure/usecase_input.dart';
import 'package:transport_management/infrastructure/usecase_output.dart';

class DeleteAuthUsecaseInput extends Input {
  DeleteAuthUsecaseInput();
}

class DeleteAuthUsecaseOutput extends Output {
  DeleteAuthUsecaseOutput();
}

@lazySingleton
class DeleteAuthUsecase
    extends Usecase<DeleteAuthUsecaseInput, DeleteAuthUsecaseOutput> {
  final AuthRepository _authRepository;

  DeleteAuthUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<DeleteAuthUsecaseOutput> call(DeleteAuthUsecaseInput input) async {
    return await _authRepository.deleteAuth(input);
  }
}
