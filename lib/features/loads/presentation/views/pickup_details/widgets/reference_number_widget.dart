import 'package:avcons/common/extensions/app_localization.dart';
import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/gen/assets.gen.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReferenceNumberWidget extends StatelessWidget {
  const ReferenceNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: context.appLocale.referenceNumber,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          10.hb,
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            decoration: BoxDecoration(
              color: R.colors.white_FFFFFF,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17.w),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 142.w,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20.r,
                              width: 20.r,
                              child: Assets.svgs.loadIdIcon.svg(),
                            ),
                            6.wb,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: context.appLocale.purchaseOrder,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                                2.hb,
                                AppText(
                                  text: '0123456789',
                                  color: R.colors.grey_4D4D4D,
                                  fontSize: 14,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      31.wb,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.r,
                            width: 20.r,
                            child: Assets.svgs.ratePerMileIcon.svg(),
                          ),
                          6.wb,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: context.appLocale.pickupNumber,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                              2.hb,
                              AppText(
                                text: '€ 2.3/ml',
                                color: R.colors.grey_4D4D4D,
                                fontSize: 14,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
