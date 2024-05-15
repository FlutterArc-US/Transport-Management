import 'package:injectable/injectable.dart';
import 'package:transport_management/features/auth/domain/repository/auth_repository.dart';
import 'package:transport_management/infrastructure/usecase.dart';
import 'package:transport_management/infrastructure/usecase_input.dart';
import 'package:transport_management/infrastructure/usecase_output.dart';

class UpdateProfileUsecaseInput extends Input {
  UpdateProfileUsecaseInput({
    required this.bearer,
    this.verificationToken,
    this.email,
    this.fullName,
    this.password,
    this.phone,
    this.countryCode,
    this.img,
  });

  final String? bearer;
  final String? img;
  final String? email;
  final String? fullName;
  final String? password;
  final String? verificationToken;
  final String? phone;
  final String? countryCode;
}

class UpdateProfileUsecaseOutput extends Output {
  UpdateProfileUsecaseOutput();
}

@lazySingleton
class UpdateProfileUsecase
    extends Usecase<UpdateProfileUsecaseInput, UpdateProfileUsecaseOutput> {
  final AuthRepository _authRepository;

  UpdateProfileUsecase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<UpdateProfileUsecaseOutput> call(
      UpdateProfileUsecaseInput input) async {
    return await _authRepository.updateProfile(input);
  }
}
