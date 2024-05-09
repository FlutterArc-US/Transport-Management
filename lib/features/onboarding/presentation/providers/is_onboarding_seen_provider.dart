import 'package:avcons/features/onboarding/domain/usecases/is_onboard_seen.dart';
import 'package:avcons/util/di/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_onboarding_seen_provider.g.dart';

@riverpod
Future<bool> isOnboardingSeen(Ref ref) async {
  final isOnboardingSeenUsecase = sl<IsOnboardSeenUsecase>();
  final input = IsOnboardSeenUsecaseInput();
  final output = await isOnboardingSeenUsecase(input);
  final hasSeenOnboard = output.hasSeenOnboard;
  return hasSeenOnboard;
}
