import 'package:avcons/common/extensions/app_localization.dart';
import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/gen/assets.gen.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadInfoCardWidget extends StatelessWidget {
  const LoadInfoCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 352.w,
      padding: EdgeInsets.symmetric(vertical: 15.h),
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: Row(
              children: [
                SizedBox(
                  width: 120.w,
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
                            text: context.appLocale.loadId,
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
                60.wb,
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
                          text: context.appLocale.ratePerMile,
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
          11.hb,
          const Divider(),
          11.hb,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: Row(
              children: [
                SizedBox(
                  width: 120.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.r,
                        width: 20.r,
                        child: Assets.svgs.packageTypeIcon.svg(),
                      ),
                      6.wb,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: context.appLocale.packageType,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                          2.hb,
                          AppText(
                            text: '40 Pallets',
                            color: R.colors.grey_4D4D4D,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                60.wb,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.r,
                      width: 20.r,
                      child: Assets.svgs.commodityIcon.svg(),
                    ),
                    6.wb,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: context.appLocale.commodity,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                        2.hb,
                        AppText(
                          text: 'Dry Food',
                          color: R.colors.grey_4D4D4D,
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
