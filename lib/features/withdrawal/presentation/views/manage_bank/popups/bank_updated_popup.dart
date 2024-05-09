import 'package:avcons/common/extensions/app_localization.dart';
import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/common/widgets/app_filled_button.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/features/withdrawal/presentation/providers/withdrawal_form_provider/withdrawal_form_provider.dart';
import 'package:avcons/gen/assets.gen.dart';
import 'package:avcons/util/loading/loading.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:avcons/util/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BankUpdatedPopup extends ConsumerStatefulWidget {
  const BankUpdatedPopup({super.key});

  @override
  ConsumerState<BankUpdatedPopup> createState() => _BankUpdatedPopupState();
}

class _BankUpdatedPopupState extends ConsumerState<BankUpdatedPopup> {
  Future<void> _updateBankAccount() async {
    try {
      loading(context);
      GoRouter.of(context).pop();
      GoRouter.of(context).pop();
    } catch (e) {
      showToast(msg: context.appLocale.somethingWentWrong);
    } finally {
      dismissLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(withdrawalFormProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              borderRadius: BorderRadius.circular(60.r),
              onTap: () {
                GoRouter.of(context).pop();
              },
              child: Assets.svgs.closeIcon.svg(),
            ),
          ),
          12.hb,
          Assets.pngs.bankUpdateImage.image(
            width: 232.w,
            height: 128.h,
          ),
          56.hb,
          AppText(
            text: context.appLocale.bankUpdated,
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: R.colors.navyBlue_263C51,
          ),
          13.hb,
          AppText(
            text: context.appLocale.bankDetailsUpdatedSuccess,
            fontSize: 14,
            color: R.colors.navyBlue_263C51,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          AppFilledButton(
            text: context.appLocale.done,
            onTap: _updateBankAccount,
            width: 330,
          ),
          29.hb,
        ],
      ),
    );
  }
}
