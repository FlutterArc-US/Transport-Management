import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/auth/domain/usecases/verify_otp.dart';
import 'package:transport_management/features/auth/presentation/providers/otp_form_provider/otp_form_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/reset_password/reset_password_form_provider.dart';
import 'package:transport_management/util/di/di.dart';

part 'verify_reset_password_otp_provider.g.dart';

@riverpod
Future<void> verifyResetPasswordOtp(VerifyResetPasswordOtpRef ref) async {
  final verifyResetPasswordOtp = sl<VerifyOtpUsecase>();

  final form = ref.read(resetPasswordFormProvider);
  final otp = ref.read(otpFormNotifierProvider);

  final input = VerifyOtpUsecaseInput(
    otp: otp!,
    phone: form.phone!,
  );

  final output = await verifyResetPasswordOtp(input);
  ref
      .read(resetPasswordFormProvider.notifier)
      .setVerificationToken(output.verificationToken);
}
