////********** START IMPORTS **********////
import 'package:injectable/injectable.dart';
import 'package:transport_management/features/onboarding/data/source/local/onboarding_local_datasource.dart';
import 'package:transport_management/features/onboarding/domain/repository/onboarding_repository.dart';
import 'package:transport_management/features/onboarding/domain/usecases/is_onboard_seen.dart';
import 'package:transport_management/features/onboarding/domain/usecases/set_onboard_seen.dart';
////********** END IMPORTS **********////

@LazySingleton(as: OnboardingRepository)
class OnboardingRepositoryImp implements OnboardingRepository {
////********** START VARIABLES **********////
  final OnboardingLocalDataSource _onboardingLocalDataSource;
////********** END VARIABLES **********////

  OnboardingRepositoryImp({
////********** START RECEIVE VALUES **********////
    required OnboardingLocalDataSource onboardingLocalDataSource,
////********** END RECEIVE VALUES **********////
  }) :
////********** START SET VALUES **********////
        _onboardingLocalDataSource = onboardingLocalDataSource
////********** END SET VALUES **********////
  ;

////********** START METHODS **********////
  /// [IsOnboardSeenUsecaseInput] is received to [isOnboardSeen] method as parameter
  /// [IsOnboardSeenUsecaseOutput] is returned from [isOnboardSeen] method
  @override
  Future<IsOnboardSeenUsecaseOutput> isOnboardSeen(
      IsOnboardSeenUsecaseInput input) async {
    return _onboardingLocalDataSource.isOnboardSeen(input);
  }

  /// [SetOnboardSeenUsecaseInput] is received to [setOnboardSeen] method as parameter
  /// [SetOnboardSeenUsecaseOutput] is returned from [setOnboardSeen] method
  @override
  Future<SetOnboardSeenUsecaseOutput> setOnboardSeen(
      SetOnboardSeenUsecaseInput input) async {
    return _onboardingLocalDataSource.setOnboardSeen(input);
  }

////********** END METHODS **********////
}
