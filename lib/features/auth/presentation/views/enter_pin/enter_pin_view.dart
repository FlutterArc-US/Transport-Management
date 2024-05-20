import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/otp_field_widget.dart';
import 'package:transport_management/features/auth/presentation/providers/auth_step_provider/auth_step_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/otp_form_provider/otp_form_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/reset_password/reset_password_form_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/update_profile_provider/update_profile_form_provider.dart';
import 'package:transport_management/features/auth/presentation/views/widgets/auth_bg_widget.dart';
import 'package:transport_management/util/exceptions/message_exception.dart';
import 'package:transport_management/util/loading/loading.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/router/paths.dart';
import 'package:transport_management/util/toast/toast.dart';

class EnterPinView extends ConsumerStatefulWidget {
  const EnterPinView({
    this.profileChangePassword,
    super.key,
  });

  final bool? profileChangePassword;

  @override
  ConsumerState createState() => _OTPVerificationViewState();
}

class _OTPVerificationViewState extends ConsumerState<EnterPinView> {
  void _login() {
    try {
      loading(context);
      if (!mounted) return;

      GoRouter.of(context).go(RoutePaths.home);
    } on MessageException catch (e) {
      showToast(msg: e.message);
    } catch (e) {
      if (!mounted) return;
      showToast(msg: context.appLocale.somethingWentWrong);
    } finally {
      dismissLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(authStepNotifierProvider);
    ref.watch(resetPasswordFormProvider);
    ref.watch(otpFormNotifierProvider);
    ref.watch(updateProfileFormProvider);

    return AuthBgWidget(
      height: 481.h,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: Column(
            children: [
              44.hb,
              AppText(
                text: context.appLocale.enterPin,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: R.colors.black_FF000000,
              ),
              7.95.hb,
              AppText(
                text: context.appLocale.enterYourPinToLogin,
                fontSize: 14,
                color: R.colors.grey_7B7B7B,
                textAlign: TextAlign.center,
              ),
              44.92.hb,
              OtpWidget(
                onChanged: (v) {
                  ref.read(otpFormNotifierProvider.notifier).state = v;
                },
              ),
              16.82.hb,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: AppText(
                      text: context.appLocale.forgotYourPin,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: R.colors.black_1E1E1E,
                    ),
                  ),
                ],
              ),
              97.hb,
              Center(
                child: AppFilledButton(
                  text: context.appLocale.login,
                  onTap: _login,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
