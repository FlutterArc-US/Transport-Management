import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';

class AdditionalDetailsWidget extends StatelessWidget {
  const AdditionalDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: context.appLocale.details,
            fontSize: 16,
            fontWeight: FontWeight.w500,
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
                      /// [Appointment]
                      SizedBox(
                        width: 142.w,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20.r,
                              width: 20.r,
                              child: Assets.svgs.loadIdIcon.svg(
                                colorFilter: ColorFilter.mode(
                                  R.colors.green_337A34,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            6.wb,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: context.appLocale.loadId,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                4.hb,
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

                      /// [Contact]
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.r,
                            width: 20.r,
                            child: Assets.svgs.weightIcon.svg(
                              colorFilter: ColorFilter.mode(
                                R.colors.green_337A34,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          6.wb,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: context.appLocale.weight,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              4.hb,
                              AppText(
                                text: '555 123-4567',
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
                      /// [Restrooms]
                      SizedBox(
                        width: 142.w,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20.r,
                              width: 20.r,
                              child: Assets.svgs.packageTypeIcon.svg(
                                colorFilter: ColorFilter.mode(
                                  R.colors.green_337A34,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            6.wb,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: context.appLocale.packageType,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                4.hb,
                                AppText(
                                  text: '4',
                                  color: R.colors.grey_4D4D4D,
                                  fontSize: 14,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      31.wb,

                      /// [On-Site Scale]
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.r,
                            width: 20.r,
                            child: Assets.svgs.commodityIcon.svg(
                              colorFilter: ColorFilter.mode(
                                R.colors.green_337A34,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          6.wb,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: context.appLocale.commodity,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              4.hb,
                              AppText(
                                text: '4321',
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
