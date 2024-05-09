import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/gen/assets.gen.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
