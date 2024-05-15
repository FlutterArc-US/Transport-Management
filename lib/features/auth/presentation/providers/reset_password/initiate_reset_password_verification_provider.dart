import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/auth/domain/usecases/initiate_reset_password_verification.dart';
import 'package:transport_management/features/auth/presentation/providers/reset_password/reset_password_form_provider.dart';
import 'package:transport_management/util/di/di.dart';

part 'initiate_reset_password_verification_provider.g.dart';

@riverpod
Future<void> initiateResetPasswordVerification(
    InitiateResetPasswordVerificationRef ref) async {
  final initiateResetPassword = sl<InitiateResetPasswordVerificationUsecase>();

  final resetPasswordForm = ref.read(resetPasswordFormProvider);
  final input = InitiateResetPasswordVerificationUsecaseInput(
    phone: resetPasswordForm.phone!,
  );

  await initiateResetPassword(input);
}
