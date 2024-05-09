import 'package:transport_management/features/onboarding/domain/usecases/set_onboard_seen.dart';
import 'package:transport_management/util/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'set_onboarding_seen_provider.g.dart';

@riverpod
Future<void> setOnboardingSeen(Ref ref) async {
  final setOnboardingSeenUsecase = sl<SetOnboardSeenUsecase>();
  final input = SetOnboardSeenUsecaseInput();

  await setOnboardingSeenUsecase(input);
}
