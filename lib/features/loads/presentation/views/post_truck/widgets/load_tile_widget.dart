import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/compact_number_formatter.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/loads/domain/models/load/load_model.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/datetime_formatter/datetime_formatter.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoadTileWidget extends StatelessWidget {
  const LoadTileWidget({
    super.key,
    this.showPodButton = false,
    this.load,
  });

  final LoadModel? load;
  final bool showPodButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.r),
      onTap: () {
        GoRouter.of(context).push(
          RoutePaths.loadDetails,
          extra: load,
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 12.h),
        child: Container(
          width: 352.w,
          height: showPodButton ? 232.h : 200.h,
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
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 7.h,
                    horizontal: 15.w,
                  ),
                  decoration: BoxDecoration(
                    color: R.colors.navyBlue_263C51,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.r),
                      bottomLeft: Radius.circular(20.r),
                    ),
                  ),
                  child: AppText(
                    text: context.appLocale.amountWithCurrency(load?.cost ?? 0),
                    color: R.colors.white_FFFFFF,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                top: 21.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 19.w),
                      child: SizedBox(
                        width: 340.w,
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
                                  height: 56.h,
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
                            SizedBox(
                              height: 104.h,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 200.w,
                                        child: AppText(
                                          text: load?.pickup.address ??
                                              'Houston, TX',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: R.colors.black_414143,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      2.hb,
                                      if (load?.pickupTime != null)
                                        AppText(
                                          text:
                                              convertTimestampToFormattedString(
                                                  load!.pickupTime),
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
                                          SizedBox(
                                            width: 200.w,
                                            child: AppText(
                                              text: load?.delivery.address ??
                                                  'Houston, TX',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: R.colors.black_414143,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ),
                                          2.hb,
                                          if (load?.dropTime != null)
                                            AppText(
                                              text:
                                                  convertTimestampToFormattedString(
                                                      load!.dropTime),
                                              fontSize: 12,
                                              color: R.colors.navyBlue_263C51,
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Assets.svgs.moveSelectionRightIcon.svg(
                                  height: 10.h,
                                  width: 16.w,
                                ),
                                3.wb,
                                AppText(
                                  text: '${load?.deadHead ?? 0} Deadhead',
                                  fontSize: 12,
                                  color: R.colors.navyBlue_263C51,
                                ),
                                2.wb,
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    12.hb,
                    if (showPodButton)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Column(
                          children: [
                            37.hb,
                            AppFilledButton(
                              text: context.appLocale.uploadPod,
                              onTap: () {},
                            ),
                          ],
                        ),
                      )
                    else
                      Column(
                        children: [
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
                                      text:
                                          '${(load?.distance ?? 0.0).asKNotation()} MI',
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
                                      text:
                                          '${(load?.weight ?? 0).asKNotation()} lbs',
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
                                    load?.vehicleModel.img != null
                                        ? SizedBox(
                                            height: 16.r,
                                            width: 16.r,
                                            child: SvgPicture.string(
                                              load!.vehicleModel.img,
                                              colorFilter: ColorFilter.mode(
                                                R.colors.blue_20B4E3,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                          )
                                        : Assets.svgs.shippingIcon.svg(
                                            height: 16.r,
                                            width: 16.r,
                                          ),
                                    10.wb,
                                    AppText(
                                      text: load?.vehicleModel.name ?? '',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: R.colors.navyBlue_263C51,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
