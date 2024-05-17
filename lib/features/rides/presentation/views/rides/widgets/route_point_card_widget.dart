import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/router/paths.dart';

class RoutePointCardWidget extends StatelessWidget {
  const RoutePointCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(RoutePaths.tripPoint);
      },
      child: Container(
        width: 288.w,
        padding: EdgeInsets.only(
          bottom: 9.h,
          left: 10.w,
          right: 10.w,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9.7.r),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              offset: Offset(0, 1),
              blurRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 60.w,
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  color: R.colors.grey_7C7777,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(9.7.r),
                    bottomRight: Radius.circular(9.7.r),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 10.r,
                      width: 10.r,
                      child: Assets.svgs.timerIcon.svg(),
                    ),
                    5.wb,
                    AppText(
                      text: '4 Hrs',
                      fontSize: 8,
                      color: R.colors.white_FFFFFF,
                    )
                  ],
                ),
              ),
            ),
            4.hb,
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const AppText(
                      text: 'Tow the Trailer',
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    4.hb,
                    AppText(
                      text: '2895 Ave. Houston, TX',
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: R.colors.grey_7B7B7B,
                    ),
                    2.hb,
                    AppText(
                      text: 'Jan 28, 2024 14:30 CST',
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: R.colors.grey_7B7B7B,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Assets.svgs.deliveryIcon.svg(
                      colorFilter: ColorFilter.mode(
                        R.colors.green_85C933,
                        BlendMode.srcIn,
                      ),
                    ),
                    4.wb,
                    AppText(
                      text: context.appLocale.delivery,
                      fontSize: 10,
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Assets.svgs.weightIcon.svg(
                      colorFilter: ColorFilter.mode(
                        R.colors.green_85C933,
                        BlendMode.srcIn,
                      ),
                    ),
                    4.wb,
                    const AppText(
                      text: '14K lbs',
                      fontSize: 10,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
