import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_outlined_text_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/features/earnings/domain/models/payment_status/payment_status.dart';
import 'package:transport_management/features/withdrawal/presentation/providers/withdrawal_form_provider/withdrawal_form_provider.dart';
import 'package:transport_management/features/withdrawal/presentation/views/withdrawal/widgets/withdrawal_tile_widget.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/router/paths.dart';
import 'package:transport_management/util/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WithdrawalView extends ConsumerWidget {
  const WithdrawalView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final withdrawalForm = ref.watch(withdrawalFormProvider);

    return Scaffold(
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Column(
          children: [
            MediaQuery.of(context).padding.top.hb,
            const BackButtonWidget(),
            20.49.hb,
            AppText(
              text: context.appLocale.withdraw,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
            25.hb,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 19.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 170.w,
                    height: 87.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      gradient: LinearGradient(
                        colors: [
                          R.colors.green_0DD168,
                          R.colors.green_076B35,
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: context.appLocale.availableBalance,
                          fontSize: 12,
                          color: R.colors.white_FFFFFF,
                          fontWeight: FontWeight.w600,
                        ),
                        10.hb,
                        AppText(
                          text: context.appLocale.amountWithCurrency(100000),
                          fontSize: 32,
                          color: R.colors.white_FFFFFF,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 170.w,
                    height: 87.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      gradient: LinearGradient(
                        colors: [
                          R.colors.blue_305477,
                          R.colors.blue_001020,
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: context.appLocale.earlyWithdraw,
                          fontSize: 12,
                          color: R.colors.white_FFFFFF,
                          fontWeight: FontWeight.w600,
                        ),
                        10.hb,
                        AppText(
                          text: context.appLocale.amountWithCurrency(100000),
                          fontSize: 32,
                          color: R.colors.white_FFFFFF,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            25.hb,
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 21.w),
                child: AppText(
                  text: context.appLocale.withdrawalRequests,
                  fontSize: 16,
                  color: R.colors.grey_4D4D4D,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    WithdrawalTileWidget(
                      status: PaymentStatus.paid,
                    ),
                    WithdrawalTileWidget(
                      status: PaymentStatus.refunded,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            AppFilledButton(
              width: 330,
              text: context.appLocale.withdrawFunds,
              onTap: () {
                if (withdrawalForm.accountTitle != null) {
                  GoRouter.of(context).push(RoutePaths.withdrawFunds);
                } else {
                  showToast(msg: 'Add Bank first');
                }
              },
            ),
            27.hb,
            if (withdrawalForm.accountTitle != null)
              AppOutlinedTextButton(
                width: 330,
                text: context.appLocale.manageBankAccount,
                onTap: () {
                  GoRouter.of(context).push(RoutePaths.manageBank);
                },
              )
            else
              AppOutlinedTextButton(
                text: context.appLocale.addBankAccount,
                width: 330,
                onTap: () {
                  GoRouter.of(context).push(RoutePaths.manageBank);
                },
              ),
            30.hb,
          ],
        ),
      ),
    );
  }
}
