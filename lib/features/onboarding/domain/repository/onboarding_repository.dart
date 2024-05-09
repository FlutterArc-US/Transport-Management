////********** START IMPORTS **********////
import 'package:avcons/features/onboarding/domain/usecases/is_onboard_seen.dart';
import 'package:avcons/features/onboarding/domain/usecases/set_onboard_seen.dart';
import 'package:avcons/infrastructure/repository.dart';
////********** END IMPORTS **********////

abstract class OnboardingRepository extends Repository {
////********** START METHODS **********////
  /// [IsOnboardSeenUsecaseInput] is received to [isOnboardSeen] method as parameter
  /// [IsOnboardSeenUsecaseOutput] is returned from [isOnboardSeen] method
  Future<IsOnboardSeenUsecaseOutput> isOnboardSeen(
      IsOnboardSeenUsecaseInput input);

  /// [SetOnboardSeenUsecaseInput] is received to [setOnboardSeen] method as parameter
  /// [SetOnboardSeenUsecaseOutput] is returned from [setOnboardSeen] method
  Future<SetOnboardSeenUsecaseOutput> setOnboardSeen(
      SetOnboardSeenUsecaseInput input);

////********** END METHODS **********////
}
