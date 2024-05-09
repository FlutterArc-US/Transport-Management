import 'package:avcons/features/auth/domain/usecases/initiate_verification.dart';
import 'package:avcons/util/di/di.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'initiate_verification_provider.g.dart';

@riverpod
Future<void> initiateVerification(
    InitiateVerificationRef ref, String phone) async {
  final initiateVerification = sl<InitiateVerificationUsecase>();

  final input = InitiateVerificationUsecaseInput(phone: phone);

  await initiateVerification(input);
}
