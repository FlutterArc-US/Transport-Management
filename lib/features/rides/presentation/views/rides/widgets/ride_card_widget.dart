import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/compact_number_formatter.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/rides/domain/models/load/load_model.dart';
import 'package:transport_management/features/rides/presentation/views/rides/widgets/route_point_card_widget.dart';
import 'package:transport_management/features/rides/presentation/views/rides/widgets/vertical_stepper_widget.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/datetime_formatter/datetime_formatter.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/router/paths.dart';

class RideCardWidget extends StatelessWidget {
  const RideCardWidget({
    super.key,
    this.load,
  });

  final LoadModel? load;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.r),
        onTap: () {
          GoRouter.of(context).push(
            RoutePaths.loadDetails,
            extra: load,
          );
        },
        child: Container(
          width: 352.w,
          decoration: BoxDecoration(
            color: R.colors.white_FFFFFF,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 9,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 29.h,
                    width: 132.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 22.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: R.colors.grey_7C7777,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                      ),
                    ),
                    child: AppText(
                      text: 'ECTF 0421',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: R.colors.white_FFFFFF,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 29.h,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      decoration: BoxDecoration(
                        color: R.colors.black_FF000000,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.r),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Spacer(),
                          Assets.svgs.trailorIcon.svg(
                            width: 24.r,
                            height: 24.r,
                            colorFilter: ColorFilter.mode(
                              R.colors.white_FFFFFF,
                              BlendMode.srcIn,
                            ),
                          ),
                          4.wb,
                          AppText(
                            text: 'Refrigerator Trailer',
                            fontSize: 10,
                            color: R.colors.white_FFFFFF,
                          ),
                          12.wb,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              17.hb,
              Padding(
                padding: EdgeInsets.only(left: 19.w),
                child: SizedBox(
                  width: 340.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VerticalStepperWidget(length: 4),
                      15.wb,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          4,
                          (index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 9.h),
                              child: const RoutePointCardWidget(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              24.hb,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 29.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 22.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: R.colors.green_337A34,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.r),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Assets.svgs.mileIcon.svg(
                            colorFilter: ColorFilter.mode(
                              R.colors.white_FFFFFF,
                              BlendMode.srcIn,
                            ),
                          ),
                          6.wb,
                          AppText(
                            text: '1200 MI',
                            fontSize: 10,
                            color: R.colors.white_FFFFFF,
                          ),
                          16.wb,
                          Assets.svgs.timerIcon.svg(
                            colorFilter: ColorFilter.mode(
                              R.colors.white_FFFFFF,
                              BlendMode.srcIn,
                            ),
                          ),
                          6.wb,
                          AppText(
                            text: '4 Hrs',
                            fontSize: 10,
                            color: R.colors.white_FFFFFF,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 29.h,
                    width: 104.w,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(
                      vertical: 8.h,
                      horizontal: 30.w,
                    ),
                    decoration: BoxDecoration(
                      color: R.colors.green_074834,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20.r),
                      ),
                    ),
                    child: AppText(
                      text: context.appLocale.details,
                      fontSize: 10,
                      color: R.colors.white_FFFFFF,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
