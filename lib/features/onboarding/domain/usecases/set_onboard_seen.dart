import 'package:injectable/injectable.dart';
import 'package:transport_management/features/onboarding/domain/repository/onboarding_repository.dart';
import 'package:transport_management/infrastructure/usecase.dart';
import 'package:transport_management/infrastructure/usecase_input.dart';
import 'package:transport_management/infrastructure/usecase_output.dart';

class SetOnboardSeenUsecaseInput extends Input {
  SetOnboardSeenUsecaseInput();
}

class SetOnboardSeenUsecaseOutput extends Output {
  SetOnboardSeenUsecaseOutput();
}

@lazySingleton
class SetOnboardSeenUsecase
    extends Usecase<SetOnboardSeenUsecaseInput, SetOnboardSeenUsecaseOutput> {
  final OnboardingRepository _onboardingRepository;

  SetOnboardSeenUsecase({required OnboardingRepository onboardingRepository})
      : _onboardingRepository = onboardingRepository;

  @override
  Future<SetOnboardSeenUsecaseOutput> call(
      SetOnboardSeenUsecaseInput input) async {
    return await _onboardingRepository.setOnboardSeen(input);
  }
}
