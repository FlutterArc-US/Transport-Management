import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/loads/presentation/views/load_rating/load_rating_popup.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';

class DocsSubmittedPopup extends ConsumerWidget {
  const DocsSubmittedPopup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () => GoRouter.of(context).pop(),
              child: Assets.svgs.closeIcon.svg(
                height: 32.r,
                width: 32.r,
              ),
            ),
          ),
          SizedBox(
            width: 146.w,
            height: 190.h,
            child: Assets.svgs.docSubmittedIcon.svg(),
          ),
          12.hb,
          SizedBox(
            width: 268.w,
            child: AppText(
              text: context.appLocale.docSubmitted,
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: R.colors.navyBlue_263C51,
              textAlign: TextAlign.center,
            ),
          ),
          13.hb,
          SizedBox(
            width: 300.w,
            child: AppText(
              text: context.appLocale.podSubmittedSuccess,
              fontSize: 14,
              color: R.colors.navyBlue_263C51,
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          AppFilledButton(
            width: 300,
            text: context.appLocale.gotIt,
            onTap: () {
              GoRouter.of(context).pop();

              showModalBottomSheet<void>(
                context: context,
                showDragHandle: true,
                scrollControlDisabledMaxHeightRatio: 0.72,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                builder: (context) {
                  return const LoadRatingPopup();
                },
              );
            },
          ),
          29.hb,
        ],
      ),
    );
  }
}
