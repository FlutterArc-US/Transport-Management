import 'package:avcons/features/auth/domain/models/driver/driver_entity.dart';
import 'package:avcons/features/auth/domain/models/driver/driver_model.dart';
import 'package:avcons/features/auth/domain/repository/auth_repository.dart';
import 'package:avcons/infrastructure/usecase.dart';
import 'package:avcons/infrastructure/usecase_input.dart';
import 'package:avcons/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class CurrentUserUsecaseInput extends Input {
  CurrentUserUsecaseInput({required this.bearer});

  final String bearer;
}

class CurrentUserUsecaseOutput extends Output {
  CurrentUserUsecaseOutput({required DriverEntity driver}) : _driver = driver;

  final DriverEntity _driver;

  DriverModel get driver => DriverModel.fromEntity(_driver);
}

@lazySingleton
class CurrentUserUsecase
    extends Usecase<CurrentUserUsecaseInput, CurrentUserUsecaseOutput> {
  final AuthRepository _authRepository;

  CurrentUserUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<CurrentUserUsecaseOutput> call(CurrentUserUsecaseInput input) async {
    return await _authRepository.currentUser(input);
  }
}
