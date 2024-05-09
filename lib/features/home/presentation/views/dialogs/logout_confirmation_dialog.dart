import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_outlined_text_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/dialog_box.dart';
import 'package:transport_management/features/auth/presentation/providers/logout_provider/logout_provider.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/loading/loading.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/router/paths.dart';
import 'package:transport_management/util/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LogoutConfirmationPopup extends ConsumerWidget {
  const LogoutConfirmationPopup({super.key});

  Future<void> _logout(BuildContext context, WidgetRef ref) async {
    try {
      loading(context);
      await ref.read(logoutProvider.future);
      if (!context.mounted) return;
      GoRouter.of(context).go(RoutePaths.login);
    } catch (e) {
      showToast(msg: context.appLocale.somethingWentWrong);
    } finally {
      dismissLoading();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DialogBox(
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Column(
          children: [
            12.hb,
            Assets.svgs.logoutIcon.svg(
              height: 86.36.r,
              width: 86.36.r,
            ),
            22.hb,
            AppText(
              text: context.appLocale.logoutConfirmation,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: R.colors.black_FF000000,
              textAlign: TextAlign.center,
            ),
            49.hb,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppOutlinedTextButton(
                  width: 103,
                  height: 40,
                  color: R.colors.grey_717171,
                  text: context.appLocale.cancel,
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                ),
                AppFilledButton(
                  width: 103,
                  height: 40,
                  text: context.appLocale.yes,
                  onTap: () => _logout(context, ref),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
