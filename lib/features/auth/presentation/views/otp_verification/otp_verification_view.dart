import 'dart:async';

import 'package:avcons/common/extensions/app_localization.dart';
import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/common/widgets/app_filled_button.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/common/widgets/otp_field_widget.dart';
import 'package:avcons/features/auth/presentation/providers/auth_step_provider/auth_step_provider.dart';
import 'package:avcons/features/auth/presentation/providers/otp_form_provider/otp_form_provider.dart';
import 'package:avcons/features/auth/presentation/providers/reset_password/initiate_reset_password_verification_provider.dart';
import 'package:avcons/features/auth/presentation/providers/reset_password/reset_password_form_provider.dart';
import 'package:avcons/features/auth/presentation/providers/update_profile_provider/update_profile_form_provider.dart';
import 'package:avcons/features/auth/presentation/providers/update_profile_provider/update_profile_provider.dart';
import 'package:avcons/features/auth/presentation/providers/verify_reset_password_otp_provider/verify_reset_password_otp_provider.dart';
import 'package:avcons/features/auth/presentation/providers/verify_update_profile_otp_provider/verify_update_profile_otp_provider.dart';
import 'package:avcons/features/auth/presentation/views/widgets/auth_bg_widget.dart';
import 'package:avcons/util/exceptions/message_exception.dart';
import 'package:avcons/util/loading/loading.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:avcons/util/router/paths.dart';
import 'package:avcons/util/toast/toast.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OTPVerificationView extends ConsumerStatefulWidget {
  const OTPVerificationView({
    this.profileChangePassword,
    super.key,
  });

  final bool? profileChangePassword;

  @override
  ConsumerState createState() => _OTPVerificationViewState();
}

class _OTPVerificationViewState extends ConsumerState<OTPVerificationView> {
  late Timer _timer;
  int _secondsRemaining = 60;
  bool resendCode = false;

  Future<void> _verifyOtp() async {
    final otp = ref.read(otpFormNotifierProvider);
    FocusManager.instance.primaryFocus?.unfocus();

    try {
      loading(context);
      if (otp != null && otp.length == 4) {
        if (widget.profileChangePassword != null &&
            widget.profileChangePassword!) {
          await ref.read(verifyUpdateProfileOtpProvider.future);

          if (!mounted) return;

          GoRouter.of(context).pop();

          await ref.read(updateProfileProvider.future);
          if (!mounted) return;

          showToast(msg: context.appLocale.profileUpdatedSuccessfully);
        } else {
          await ref.read(verifyResetPasswordOtpProvider.future);
          if (!mounted) return;

          showToast(msg: context.appLocale.otpVerifiedSuccessfully);
          if (!mounted) return;

          GoRouter.of(context).pushReplacement(RoutePaths.resetPassword);
        }
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

  Future<void> _resendOtp() async {
    try {
      loading(context);

      await ref.read(initiateResetPasswordVerificationProvider.future);

      setState(() {
        _secondsRemaining = 60;
      });

      startTimer();

      if (!mounted) return;

      showToast(msg: context.appLocale.otpSentToYourPhone);
    } on MessageException catch (e) {
      showToast(msg: e.message);
    } catch (e) {
      showToast(msg: context.appLocale.somethingWentWrong);
    } finally {
      dismissLoading();
    }
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_secondsRemaining == 0) {
            resendCode = true;
          }
          if (_secondsRemaining < 1) {
            timer.cancel();
          } else {
            _secondsRemaining -= 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(authStepNotifierProvider);
    ref.watch(resetPasswordFormProvider);
    ref.watch(otpFormNotifierProvider);
    ref.watch(updateProfileFormProvider);

    return AuthBgWidget(
      height: 507.h,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: Column(
            children: [
              44.hb,
              AppText(
                text: context.appLocale.verificationOTP,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: R.colors.black_FF000000,
              ),
              7.95.hb,
              AppText(
                text: context.appLocale.enter4DigitOTP,
                fontSize: 15,
                color: R.colors.black_414143,
                textAlign: TextAlign.center,
              ),
              44.92.hb,
              OtpWidget(
                onChanged: (v) {
                  ref.read(otpFormNotifierProvider.notifier).state = v;
                },
              ),
              16.82.hb,
              if (_secondsRemaining <= 0)
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: R.colors.black_FF000000,
                        fontFamily: 'Urbanist',
                      ),
                      children: [
                        TextSpan(
                          text: context.appLocale.didNotReceiveACode,
                        ),
                        TextSpan(
                          text: ' ${context.appLocale.resendCode}',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: R.colors.blue_20B4E3,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = _resendOtp,
                        ),
                      ],
                    ),
                  ),
                )
              else
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: R.colors.grey_97A2B0,
                      fontFamily: 'Urbanist',
                    ),
                    children: [
                      const TextSpan(
                        text: 'Resend OTP in ',
                      ),
                      TextSpan(
                        text: '$_secondsRemaining seconds',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: R.colors.navyBlue_263C51,
                        ),
                      ),
                    ],
                  ),
                ),
              97.hb,
              Center(
                child: AppFilledButton(
                  text: context.appLocale.verify,
                  onTap: _verifyOtp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
