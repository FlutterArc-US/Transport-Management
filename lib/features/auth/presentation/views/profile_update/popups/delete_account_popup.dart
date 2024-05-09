import 'package:avcons/common/extensions/app_localization.dart';
import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/common/widgets/app_filled_button.dart';
import 'package:avcons/common/widgets/app_outlined_text_button.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/features/auth/presentation/providers/delete_user/delete_user_provider.dart';
import 'package:avcons/gen/assets.gen.dart';
import 'package:avcons/util/exceptions/message_exception.dart';
import 'package:avcons/util/loading/loading.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:avcons/util/router/paths.dart';
import 'package:avcons/util/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DeleteAccountPopup extends ConsumerStatefulWidget {
  const DeleteAccountPopup({super.key});

  @override
  ConsumerState<DeleteAccountPopup> createState() => _DeleteAccountPopupState();
}

class _DeleteAccountPopupState extends ConsumerState<DeleteAccountPopup> {
  Future<void> _deleteAccount() async {
    FocusManager.instance.primaryFocus?.unfocus();

    try {
      loading(context);
      await ref.read(deleteUserProvider.future);
      if (!mounted) return;

      GoRouter.of(context).go(RoutePaths.login);

      showToast(msg: context.appLocale.accountDeletedSuccessfully);
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              splashRadius: 22.r,
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              onPressed: () => GoRouter.of(context).pop(),
              icon: Assets.svgs.closeIcon.svg(),
            ),
          ),
          8.hb,
          Assets.svgs.deleteAccount.svg(
            width: 156.w,
            height: 156.h,
          ),
          40.hb,
          AppText(
            text: context.appLocale.deleteAccountQuestion,
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: R.colors.navyBlue_263C51,
          ),
          13.hb,
          AppText(
            text: context.appLocale
                .thisActionCantUndoneYourAccountWillBePermanentlyDeleted,
            fontSize: 14,
            color: R.colors.navyBlue_263C51,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          28.wb,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppOutlinedTextButton(
                width: 149,
                text: context.appLocale.yes,
                onTap: _deleteAccount,
              ),
              AppFilledButton(
                width: 149,
                text: context.appLocale.no,
                onTap: () => GoRouter.of(context).pop(),
              ),
            ],
          ),
          29.hb,
        ],
      ),
    );
  }
}
