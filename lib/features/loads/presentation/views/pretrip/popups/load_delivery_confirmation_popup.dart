import 'package:avcons/common/extensions/app_localization.dart';
import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/common/widgets/app_filled_button.dart';
import 'package:avcons/common/widgets/app_outlined_text_button.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/features/loads/presentation/views/pretrip/popups/upload_pod_popup.dart';
import 'package:avcons/gen/assets.gen.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoadDeliveryConfirmationPopup extends ConsumerWidget {
  const LoadDeliveryConfirmationPopup({super.key});

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
          26.hb,
          SizedBox(
            width: 182.w,
            height: 120.h,
            child: Assets.svgs.loadDeliveredIcon.svg(),
          ),
          30.hb,
          SizedBox(
            width: 268.w,
            child: AppText(
              text: context.appLocale.confirmDelivery,
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: R.colors.navyBlue_263C51,
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppOutlinedTextButton(
                width: 149,
                color: R.colors.blue_20B4E3,
                text: context.appLocale.no,
                onTap: () {},
              ),
              AppFilledButton(
                width: 149,
                text: context.appLocale.yes,
                onTap: () {
                  GoRouter.of(context).pop();

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
                      return const UploadPODPopup();
                    },
                  );
                },
              ),
            ],
          ),
          29.hb,
        ],
      ),
    );
  }
}
