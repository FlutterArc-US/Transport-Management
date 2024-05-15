import 'package:injectable/injectable.dart';
import 'package:transport_management/features/onboarding/domain/repository/onboarding_repository.dart';
import 'package:transport_management/infrastructure/usecase.dart';
import 'package:transport_management/infrastructure/usecase_input.dart';
import 'package:transport_management/infrastructure/usecase_output.dart';

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
