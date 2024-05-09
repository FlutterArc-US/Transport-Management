import 'package:avcons/common/extensions/app_localization.dart';
import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/features/loads/presentation/views/post_truck/widgets/load_tile_widget.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PastLoadsWidget extends StatelessWidget {
  const PastLoadsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              15.hb,
              AppText(
                text: context.appLocale.docsNeeded,
                color: R.colors.navyBlue_263C51,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              12.hb,
              const LoadTileWidget(showPodButton: true),
              16.hb,
              AppText(
                text: context.appLocale.processing,
                color: R.colors.navyBlue_263C51,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              12.hb,
              const LoadTileWidget(),
              124.hb,
            ],
          ),
        ),
      ),
    );
  }
}
