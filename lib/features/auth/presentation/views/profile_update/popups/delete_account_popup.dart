import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_outlined_text_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/auth/presentation/providers/delete_user/delete_user_provider.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/exceptions/message_exception.dart';
import 'package:transport_management/util/loading/loading.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/router/paths.dart';
import 'package:transport_management/util/toast/toast.dart';

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
          Icon(
            Icons.delete_forever_rounded,
            size: 140.w,
            color: R.colors.green_85C933,
          ),
          40.hb,
          AppText(
            text: context.appLocale.deleteAccountQuestion,
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: R.colors.black_FF000000,
          ),
          13.hb,
          AppText(
            text: context.appLocale
                .thisActionCantUndoneYourAccountWillBePermanentlyDeleted,
            fontSize: 14,
            color: R.colors.green_074834,
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
