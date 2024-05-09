import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_outlined_text_button.dart';
import 'package:transport_management/common/widgets/dialog_box.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestPermissionWidget extends StatelessWidget {
  const RequestPermissionWidget({
    required this.icon,
    required this.description,
    super.key,
  });

  final IconData icon;
  final String description;

  @override
  Widget build(BuildContext context) {
    return DialogBox(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// [Background icon]
          SizedBox(
            height: 100.r,
            width: 100.r,
            child: Icon(
              icon,
              size: 100.r,
              color: R.colors.blue_305477,
            ),
          ),

          /// [title]
          SizedBox(height: 27.88.h),

          Text(
            context.appLocale.allowPermission,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: R.colors.black_FF000000,
              letterSpacing: -0.5,
            ),
          ),

          SizedBox(height: 11.h),

          /// [detail]
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              color: R.colors.black_FF000000,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.5,
            ),
          ),

          SizedBox(height: 15.h),

          /// [Open app setting]
          AppFilledButton(
            text: context.appLocale.openAppSettings,
            onTap: () async {
              await openAppSettings();
              if (context.mounted) {
                GoRouter.of(context).pop();
              }
            },
          ),

          10.hb,

          /// [close]
          AppOutlinedTextButton(
            text: context.appLocale.close,
            onTap: () {
              GoRouter.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
