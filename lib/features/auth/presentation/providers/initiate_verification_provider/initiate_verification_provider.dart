import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/auth/domain/usecases/initiate_verification.dart';
import 'package:transport_management/util/di/di.dart';

part 'initiate_verification_provider.g.dart';

@riverpod
Future<void> initiateVerification(
    InitiateVerificationRef ref, String phone) async {
  final initiateVerification = sl<InitiateVerificationUsecase>();

  final input = InitiateVerificationUsecaseInput(phone: phone);

  await initiateVerification(input);
}
