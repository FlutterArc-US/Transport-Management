import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/withdrawal/presentation/providers/withdrawal_form_provider/withdrawal_form_provider.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/loading/loading.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/toast/toast.dart';

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
