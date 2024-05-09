import 'package:avcons/common/extensions/app_localization.dart';
import 'package:avcons/common/extensions/compact_number_formatter.dart';
import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/features/loads/domain/models/load/load_model.dart';
import 'package:avcons/gen/assets.gen.dart';
import 'package:avcons/util/datetime_formatter/datetime_formatter.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:avcons/util/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoadPickupDeliveryCardWidget extends StatelessWidget {
  const LoadPickupDeliveryCardWidget({
    this.load,
    super.key,
  });

  final LoadModel? load;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          18.hb,
          Padding(
            padding: EdgeInsets.only(left: 19.w),
            child: SizedBox(
              width: 315.w,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      InkWell(
                        onTap: () {
                          GoRouter.of(context).push(RoutePaths.pickupDetails);
                        },
                        child: buildCardTile(
                          context: context,
                          address: load?.pickup.address ?? '',
                          date: convertTimestampToFormattedString(
                              load?.pickupTime),
                          title: context.appLocale.pickup,
                          icon: Assets.svgs.pickupIcon.svg(
                            colorFilter: ColorFilter.mode(
                              R.colors.white_FFFFFF,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      16.hb,
                      InkWell(
                        onTap: () {
                          GoRouter.of(context).push(RoutePaths.deliveryDetails);
                        },
                        child: buildCardTile(
                          context: context,
                          address: load?.delivery.address ?? '',
                          date:
                              convertTimestampToFormattedString(load?.dropTime),
                          title: context.appLocale.delivery,
                          icon: Assets.svgs.deliveryIcon.svg(
                            colorFilter: ColorFilter.mode(
                              R.colors.white_FFFFFF,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          12.hb,
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
                    SizedBox(
                      height: 16.r,
                      width: 16.r,
                      child: Assets.svgs.mileIcon.svg(),
                    ),
                    10.wb,
                    AppText(
                      text: '${(load?.distance ?? 0).asKNotation()} MI',
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
                    SizedBox(
                      height: 16.r,
                      width: 16.r,
                      child: Assets.svgs.weightIcon.svg(),
                    ),
                    10.wb,
                    AppText(
                      text: '${(load?.weight ?? 0).asKNotation()} lbs',
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
                    SizedBox(
                      height: 16.r,
                      width: 16.r,
                      child: Assets.svgs.moveSelectionRightIcon.svg(),
                    ),
                    10.wb,
                    AppText(
                      text:
                          '${(load?.deadHead ?? 0).asKNotation()} ml ${context.appLocale.deadhead}',
                      fontSize: 12,
                      color: R.colors.navyBlue_263C51,
                    ),
                  ],
                ),
              ],
            ),
          ),
          12.5.hb,
        ],
      ),
    );
  }

  Widget buildCardTile({
    required BuildContext context,
    required String address,
    required String date,
    required Widget icon,
    required String title,
  }) {
    return SizedBox(
      width: 280.w,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 3.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: R.colors.navyBlue_263C51,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 16.r,
                      width: 16.r,
                      child: icon,
                    ),
                    2.wb,
                    AppText(
                      text: title,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: R.colors.white_FFFFFF,
                    ),
                  ],
                ),
              ),
              6.hb,
              Row(
                children: [
                  AppText(
                    text: address,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: R.colors.black_414143,
                  ),
                  5.wb,
                  AppText(
                    text: date,
                    fontSize: 12,
                    color: R.colors.navyBlue_263C51,
                  ),
                ],
              ),
              2.hb,
              Row(
                children: [
                  AppText(
                    text: '4.8',
                    fontSize: 12,
                    color: R.colors.grey_767680,
                    fontWeight: FontWeight.w600,
                  ),
                  Icon(
                    Icons.star_rounded,
                    color: R.colors.yellow_FBC02D,
                    size: 16.r,
                  ),
                  AppText(
                    text: 'Fresh Springs Inc.',
                    fontSize: 12,
                    color: R.colors.grey_767680,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Icon(
            Icons.chevron_right,
            size: 24.r,
            color: R.colors.navyBlue_263C51,
          )
        ],
      ),
    );
  }
}
