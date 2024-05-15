import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/loads/presentation/views/post_truck/widgets/load_tile_widget.dart';
import 'package:transport_management/util/resources/r.dart';

class ReloadsWidget extends StatelessWidget {
  const ReloadsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LoadTileWidget(),
          12.hb,
          const LoadTileWidget(),
          16.hb,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: context.appLocale.seeAllCountReloadOptions(5),
                color: R.colors.navyBlue_263C51,
                fontSize: 14,
              ),
              Container(
                height: 30.r,
                width: 30.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.r),
                  border: Border.all(
                    color: R.colors.blue_20B4E3,
                  ),
                ),
                child: Icon(
                  Icons.chevron_right,
                  size: 28.r,
                  color: R.colors.blue_20B4E3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
