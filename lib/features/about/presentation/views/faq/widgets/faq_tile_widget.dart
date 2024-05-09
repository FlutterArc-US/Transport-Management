import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/about/domain/models/faq_model.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FaqTileWidget extends StatelessWidget {
  const FaqTileWidget({
    required this.title,
    required this.description,
    this.showFull,
    super.key,
  });

  final String title;
  final String description;
  final bool? showFull;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: R.colors.grey_4D4D4D.withOpacity(0.25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 8.r,
      child: InkWell(
        onTap: showFull == true
            ? () {}
            : () {
                GoRouter.of(context).push(
                  RoutePaths.singleFaqView,
                  extra: FaqModel(title: title, description: description),
                );
              },
        borderRadius: BorderRadius.circular(20.0),
        child: Padding(
          padding: EdgeInsets.only(
            top: 10.h,
            bottom: 13.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: AppText(
                  text: title,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: R.colors.navyBlue_263C51,
                ),
              ),
              12.hb,
              Divider(
                color: R.colors.grey_E7E7E7,
              ),
              7.hb,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width:
                          showFull == null || showFull == false ? 270.w : 300.w,
                      child: AppText(
                        text: description,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: R.colors.navyBlue_263C51,
                        maxLines: showFull ?? false ? null : 2,
                        overflow: showFull ?? false
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                      ),
                    ),
                    if (showFull == null || showFull == false)
                      Icon(
                        Icons.chevron_right,
                        size: 28.r,
                        color: R.colors.navyBlue_263C51,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
