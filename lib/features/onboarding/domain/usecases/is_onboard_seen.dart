import 'package:avcons/features/onboarding/domain/repository/onboarding_repository.dart';
import 'package:avcons/infrastructure/usecase.dart';
import 'package:avcons/infrastructure/usecase_input.dart';
import 'package:avcons/infrastructure/usecase_output.dart';
import 'package:injectable/injectable.dart';

class IsOnboardSeenUsecaseInput extends Input {
  IsOnboardSeenUsecaseInput();
}

class IsOnboardSeenUsecaseOutput extends Output {
  IsOnboardSeenUsecaseOutput({required this.hasSeenOnboard});

  final bool hasSeenOnboard;
}

@lazySingleton
class IsOnboardSeenUsecase
    extends Usecase<IsOnboardSeenUsecaseInput, IsOnboardSeenUsecaseOutput> {
  final OnboardingRepository _onboardingRepository;

  IsOnboardSeenUsecase({required OnboardingRepository onboardingRepository})
      : _onboardingRepository = onboardingRepository;

  @override
  Future<IsOnboardSeenUsecaseOutput> call(
      IsOnboardSeenUsecaseInput input) async {
    return await _onboardingRepository.isOnboardSeen(input);
  }
}
