import 'package:avcons/common/extensions/app_localization.dart';
import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/common/widgets/app_filled_button.dart';
import 'package:avcons/common/widgets/app_outlined_text_button.dart';
import 'package:avcons/features/auth/domain/models/driver/driver_model.dart';
import 'package:avcons/features/auth/presentation/providers/driver_provider/driver_provider.dart';
import 'package:avcons/features/auth/presentation/providers/logout_provider/logout_provider.dart';
import 'package:avcons/features/auth/presentation/providers/register/register_form_provider.dart';
import 'package:avcons/gen/assets.gen.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:avcons/util/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AccountUnderVerificationStepWidget extends ConsumerWidget {
  const AccountUnderVerificationStepWidget({super.key});

  String confirmationText(
      BuildContext context, WidgetRef ref, DriverModel? driver) {
    final registerForm = ref.read(registerFormProvider);

    if (driver != null) {
      return driver.type == 'own'
          ? context.appLocale.confirmationEmailUponVerificationByAdmin
          : context.appLocale.confirmationEmailUponVerification;
    }

    return registerForm.typeId == 1
        ? context.appLocale.confirmationEmailUponVerificationByAdmin
        : context.appLocale.confirmationEmailUponVerification;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final driverAsync = ref.watch(driverProvider);

    if (!driverAsync.hasValue) {
      return const SizedBox.shrink();
    }

    final driver = driverAsync.value!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 37.w),
      child: Column(
        children: [
          81.hb,
          Assets.svgs.accountUnderVerificationIcon.svg(
            height: 121.r,
            width: 121.r,
          ),
          27.hb,
          Text(
            context.appLocale.accountUnderVerification,
            style: TextStyle(
              fontSize: 32.sp,
              color: R.colors.black_FF000000,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          8.hb,
          SizedBox(
            width: 229.w,
            child: Text(
              confirmationText(context, ref, driver),
              style: TextStyle(
                fontSize: 16.sp,
                color: R.colors.grey_4D4D4D,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
          43.hb,
          Center(
            child: AppFilledButton(
              text: context.appLocale.confirm,
              onTap: () => SystemNavigator.pop(),
            ),
          ),
          24.hb,
          Center(
            child: AppOutlinedTextButton(
              text: context.appLocale.logout,
              onTap: () async {
                await ref.read(logoutProvider.future);
                if (!context.mounted) return;
                GoRouter.of(context).go(RoutePaths.welcome);
              },
            ),
          ),
        ],
      ),
    );
  }
}
