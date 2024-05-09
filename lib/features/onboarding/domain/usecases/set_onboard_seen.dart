import 'package:avcons/features/onboarding/domain/repository/onboarding_repository.dart';
import 'package:avcons/infrastructure/usecase.dart';
import 'package:avcons/infrastructure/usecase_input.dart';
import 'package:avcons/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

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
