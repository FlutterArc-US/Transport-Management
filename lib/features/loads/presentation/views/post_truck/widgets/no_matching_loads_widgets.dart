import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/loads/presentation/views/post_truck/popups/post_truck_popup.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoMatchingLoadsWidget extends StatelessWidget {
  const NoMatchingLoadsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63.h,
      width: 358.w,
      padding: EdgeInsets.symmetric(horizontal: 33.w),
      decoration: BoxDecoration(
        color: R.colors.grey_F2F4F7,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: context.appLocale.noMatchingLoads,
            color: R.colors.black_414143,
          ),
          AppFilledButton(
            height: 41.h,
            width: 149.w,
            text: context.appLocale.postTruck,
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                showDragHandle: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                builder: (context) {
                  return const PostTruckPopup();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
