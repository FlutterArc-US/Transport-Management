////********** AUTOGENERATED FILE: DO NOT REMOVE ANY COMMENT IN THIS STYLE **********////
////********** START IMPORTS **********////
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:transport_management/features/onboarding/data/source/local/onboarding_local_datasource.dart';
import 'package:transport_management/features/onboarding/domain/usecases/is_onboard_seen.dart';
import 'package:transport_management/features/onboarding/domain/usecases/set_onboard_seen.dart';
import 'package:transport_management/helpers/persistence/persistence_helper.dart';
////********** END IMPORTS **********////

@LazySingleton(as: OnboardingLocalDataSource)
class OnboardingLocalDataSourceImp implements OnboardingLocalDataSource {
  final Logger _logger;
  final PersistenceHelper _persistenceHelper;

  OnboardingLocalDataSourceImp({
    required Logger logger,
    required PersistenceHelper persistenceHelper,
  })  : _logger = logger,
        _persistenceHelper = persistenceHelper;

  static const _hasSeenOnboard = 'hasSeenOnboard';

////********** START METHODS **********////
  @override
  Future<IsOnboardSeenUsecaseOutput> isOnboardSeen(
      IsOnboardSeenUsecaseInput input) async {
    final hasSeenOnboard = await _persistenceHelper.getBool(_hasSeenOnboard);
    _logger.i('Got value $hasSeenOnboard from isOnboardSeen');
    return IsOnboardSeenUsecaseOutput(hasSeenOnboard: hasSeenOnboard ?? false);
  }

  /// [SetOnboardSeenUsecaseInput] is received to [setOnboardSeen] method as parameter
  /// [SetOnboardSeenUsecaseOutput] is returned from [setOnboardSeen] method
  @override
  Future<SetOnboardSeenUsecaseOutput> setOnboardSeen(
      SetOnboardSeenUsecaseInput input) async {
    await _persistenceHelper.saveBool(_hasSeenOnboard, true);
    _logger.i('Saving true to setOnboardSeen');
    return SetOnboardSeenUsecaseOutput();
  }

////********** END METHODS **********////
}
