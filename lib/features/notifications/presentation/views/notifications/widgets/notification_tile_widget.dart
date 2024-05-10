import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';

class NotificationTileWidget extends StatelessWidget {
  const NotificationTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundColor: R.colors.blue_20B4E3,
            child: Assets.svgs.loadAssignedIcon.svg(),
          ),
          17.wb,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: 'Load Assigned!',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: R.colors.navyBlue_263C51,
              ),
              2.hb,
              AppText(
                text: 'Load #23232 has been assigned to you',
                fontSize: 14,
                color: R.colors.navyBlue_263C51,
              ),
              2.hb,
              AppText(
                text: 'Mon, 11:50 pm',
                fontSize: 12,
                color: R.colors.blue_20B4E3,
              ),
            ],
          )
        ],
      ),
    );
  }
}
