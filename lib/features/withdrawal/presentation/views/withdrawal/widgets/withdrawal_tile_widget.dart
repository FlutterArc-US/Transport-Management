import 'package:avcons/common/extensions/app_localization.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/features/earnings/domain/models/payment_status/payment_status.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WithdrawalTileWidget extends StatelessWidget {
  const WithdrawalTileWidget({required this.status, super.key});

  final PaymentStatus status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 19.w,
        vertical: 10.h,
      ),
      child: Container(
        width: 338.w,
        padding: EdgeInsets.only(
          top: 12.h,
          bottom: 12.h,
          left: 13.w,
          right: 13.w,
        ),
        decoration: BoxDecoration(
          color: R.colors.grey_CBE2EF,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            /// [Withdraw ID]
            SizedBox(
              width: 36.w,
              child: AppText(
                text: '#1',
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: R.colors.grey_4D4D4D,
              ),
            ),

            /// [Withdraw date]
            AppText(
              text: '06-June-2023, 16:30',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: R.colors.black_FF000000,
              textDirection: TextDirection.ltr,
            ),

            const Spacer(),

            /// [Paid or unpaid]
            Container(
              width: 52.w,
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 3,
              ),
              decoration: BoxDecoration(
                color:
                    status.isPaid ? R.colors.green_0DD168 : R.colors.red_DE2323,
                borderRadius: BorderRadius.circular(80.r),
                // radius
              ),
              child: AppText(
                text: status.isPaid
                    ? context.appLocale.paid
                    : context.appLocale.unpaid,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: R.colors.white_FFFFFF,
                textAlign: TextAlign.center,
              ),
            ),

            const Spacer(),

            /// [Withdraw amount]
            SizedBox(
              width: 60.w,
              child: AppText(
                textAlign: TextAlign.right,
                overflow: TextOverflow.visible,
                text: context.appLocale.amountWithCurrency(20000),
                fontSize: 14.sp,
                color: R.colors.black_FF000000,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
