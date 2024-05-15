import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/auth/domain/usecases/verify_otp.dart';
import 'package:transport_management/features/auth/presentation/providers/otp_form_provider/otp_form_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/update_profile_provider/update_profile_form_provider.dart';
import 'package:transport_management/util/di/di.dart';

part 'verify_update_profile_otp_provider.g.dart';

@riverpod
Future<void> verifyUpdateProfileOtp(VerifyUpdateProfileOtpRef ref) async {
  final verifyOtp = sl<VerifyOtpUsecase>();

  final profileForm = ref.read(updateProfileFormProvider);
  final otp = ref.read(otpFormNotifierProvider);

  final input = VerifyOtpUsecaseInput(
    otp: otp!,
    phone: profileForm.phone!,
  );

  final output = await verifyOtp(input);
  ref
      .read(updateProfileFormProvider.notifier)
      .setVerificationToken(output.verificationToken);
}
