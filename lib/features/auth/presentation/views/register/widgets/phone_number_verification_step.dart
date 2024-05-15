import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/otp_field_widget.dart';
import 'package:transport_management/features/auth/presentation/providers/otp_form_provider/otp_form_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/register/register_form_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/register_step_provider/register_step_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/verify_otp_provider/verify_otp_provider.dart';
import 'package:transport_management/util/exceptions/message_exception.dart';
import 'package:transport_management/util/loading/loading.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/toast/toast.dart';

class PhoneNumberVerificationStep extends ConsumerStatefulWidget {
  const PhoneNumberVerificationStep({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  ConsumerState<PhoneNumberVerificationStep> createState() =>
      _PhoneNumberVerificationStepState();
}

class _PhoneNumberVerificationStepState
    extends ConsumerState<PhoneNumberVerificationStep> {
  Future<void> _verifyOtp() async {
    final otp = ref.read(otpFormNotifierProvider);
    FocusManager.instance.primaryFocus?.unfocus();

    try {
      loading(context);
      if (otp != null && otp.length == 4) {
        await ref.read(verifyOtpProvider.future);
        if (!mounted) return;

        showToast(msg: context.appLocale.otpVerifiedSuccessfully);
        widget.onTap();
      } else {
        showToast(msg: context.appLocale.enterAValidOTP);
      }
    } on MessageException catch (e) {
      showToast(msg: e.message);
    } catch (e) {
      showToast(msg: context.appLocale.somethingWentWrong);
    } finally {
      dismissLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(registerFormProvider);
    final step = ref.watch(registerStepProvider);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 29.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: context.appLocale.stepNumber(step),
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
            10.hb,
            AppText(
              text: context.appLocale.verifyPhoneNumber,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            16.hb,
            Center(
              child: SizedBox(
                width: 277.w,
                child: AppText(
                  text: context.appLocale.verifyPhoneNumberWithOTP,
                  color: R.colors.black_42403F,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            20.hb,
            OtpWidget(
              onChanged: (v) {
                ref.read(otpFormNotifierProvider.notifier).state = v;
              },
            ),
            80.hb,
            Center(
              child: AppFilledButton(
                text: context.appLocale.verifyAndCreateAccount,
                onTap: _verifyOtp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
