import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/earnings/domain/models/payment_status/payment_status.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';

class EarningTileWidget extends StatelessWidget {
  const EarningTileWidget({
    required this.status,
    super.key,
  });

  final PaymentStatus status;

  String title(BuildContext context, PaymentStatus status) {
    return switch (status) {
      PaymentStatus.paid => context.appLocale.paid,
      PaymentStatus.pendingForApproval => context.appLocale.pendingApproval,
      PaymentStatus.pendingForPayment => context.appLocale.pendingPayment,
      PaymentStatus.podNotUploaded => context.appLocale.podNotUploaded,
      PaymentStatus.refunded => context.appLocale.refunded,
    };
  }

  String subtitle(BuildContext context, PaymentStatus status) {
    return switch (status) {
      PaymentStatus.paid => context.appLocale.paymentReleased,
      PaymentStatus.pendingForApproval =>
        context.appLocale.podSubmittedNotApproved,
      PaymentStatus.pendingForPayment =>
        context.appLocale.podApprovedPaymentNotReleased,
      PaymentStatus.podNotUploaded => context.appLocale.uploadPodForPayment,
      PaymentStatus.refunded => context.appLocale.paymentRefunded,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 352.w,
      decoration: BoxDecoration(
        color: R.colors.white_FFFFFF,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 9,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: status.isPaid ? 352.w * 0.5 : 352.w * 0.62,
                height: 55.h,
                padding: EdgeInsets.only(
                  left: 10.w,
                  top: 9.h,
                  bottom: 9.h,
                ),
                decoration: BoxDecoration(
                  color: status.color,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: title(context, status),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: R.colors.white_FFFFFF,
                    ),
                    3.hb,
                    AppText(
                      text: subtitle(context, status),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: R.colors.white_FFFFFF,
                    ),
                  ],
                ),
              ),
              Container(
                width: status.isPaid ? 352.w * 0.5 : 352.w * 0.38,
                height: 55.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 9.h,
                ),
                decoration: BoxDecoration(
                  color: R.colors.navyBlue_263C51,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: !status.isPaid
                    ? Center(
                        child: AppText(
                          text: context.appLocale.amountWithCurrency(220300),
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: R.colors.white_FFFFFF,
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today_sharp,
                                color: R.colors.white_FFFFFF,
                                size: 15.r,
                              ),
                              6.wb,
                              AppText(
                                text: '06-June-2023, 16:30',
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: R.colors.white_FFFFFF,
                              ),
                            ],
                          ),
                          6.hb,
                          Row(
                            children: [
                              SizedBox(
                                height: 15.r,
                                width: 15.r,
                                child: Assets.svgs.loadIdIcon.svg(
                                  colorFilter: ColorFilter.mode(
                                    R.colors.white_FFFFFF,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              6.wb,
                              AppText(
                                text: 'Load # 232232',
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: R.colors.white_FFFFFF,
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
            ],
          ),
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 19.w),
                    child: SizedBox(
                      height: 144.h,
                      child: Padding(
                        padding: EdgeInsets.only(top: 23.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 10.r,
                                  backgroundColor: R.colors.blue_20B4E3,
                                ),
                                4.hb,
                                Container(
                                  height: 50.h,
                                  width: 1.w,
                                  color: R.colors.grey_CBE2EF,
                                ),
                                4.hb,
                                CircleAvatar(
                                  radius: 10.r,
                                  backgroundColor: R.colors.grey_CBE2EF,
                                  child: CircleAvatar(
                                    radius: 4.r,
                                    backgroundColor: R.colors.white_FFFFFF,
                                  ),
                                ),
                              ],
                            ),
                            15.wb,
                            Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      text: 'Houston, TX',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: R.colors.black_414143,
                                    ),
                                    2.hb,
                                    AppText(
                                      text: 'Jan 28,14:30 CST',
                                      fontSize: 12,
                                      color: R.colors.navyBlue_263C51,
                                    ),
                                  ],
                                ),
                                32.hb,
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          text: 'Houston, TX',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: R.colors.black_414143,
                                        ),
                                        2.hb,
                                        AppText(
                                          text: 'Jan 28,14:30 CST',
                                          fontSize: 12,
                                          color: R.colors.navyBlue_263C51,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 19.w),
                                  child: Row(
                                    children: [
                                      Assets.svgs.moveSelectionRightIcon.svg(
                                        height: 10.h,
                                        width: 16.w,
                                      ),
                                      8.wb,
                                      AppText(
                                        text: '5 ml Deadhead',
                                        fontSize: 12,
                                        color: R.colors.navyBlue_263C51,
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                if (status.isPaid)
                                  Padding(
                                    padding: EdgeInsets.only(right: 19.w),
                                    child: AppText(
                                      text:
                                          '${context.appLocale.total}: ${context.appLocale.amountWithCurrency(330.00)}',
                                      fontSize: 12,
                                      color: R.colors.grey_4D4D4D,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                4.hb,
                                if (status.isPaid)
                                  Padding(
                                    padding: EdgeInsets.only(right: 19.w),
                                    child: AppText(
                                      text:
                                          '${context.appLocale.fee}: ${context.appLocale.amountWithCurrency(330.00)}',
                                      fontSize: 12,
                                      color: R.colors.orange_FE4B10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                8.hb,
                                if (status.isPaid)
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 7.h,
                                        horizontal: 15.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: R.colors.navyBlue_263C51,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.r),
                                        ),
                                      ),
                                      child: AppText(
                                        text:
                                            '${context.appLocale.net}: ${context.appLocale.amountWithCurrency(102222)}',
                                        color: R.colors.white_FFFFFF,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            height: 1.h,
            width: 352.w,
            color: R.colors.grey_E7E7E7,
          ),
          14.hb,
          SizedBox(
            width: 352.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Assets.svgs.mileIcon.svg(
                      height: 16.r,
                      width: 16.r,
                    ),
                    10.wb,
                    AppText(
                      text: '206 MI',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: R.colors.navyBlue_263C51,
                    ),
                  ],
                ),
                Container(
                  height: 16.h,
                  width: 1.w,
                  color: R.colors.grey_E7E7E7,
                ),
                Row(
                  children: [
                    Assets.svgs.weightIcon.svg(
                      height: 16.r,
                      width: 16.r,
                    ),
                    10.wb,
                    AppText(
                      text: '14.5K lbs',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: R.colors.navyBlue_263C51,
                    ),
                  ],
                ),
                Container(
                  height: 16.h,
                  width: 1.w,
                  color: R.colors.grey_E7E7E7,
                ),
                Row(
                  children: [
                    Assets.svgs.shippingIcon.svg(
                      height: 16.r,
                      width: 16.r,
                    ),
                    10.wb,
                    AppText(
                      text: context.appLocale.truckOrReefer,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: R.colors.navyBlue_263C51,
                    ),
                  ],
                ),
              ],
            ),
          ),
          18.hb,
        ],
      ),
    );
  }
}
