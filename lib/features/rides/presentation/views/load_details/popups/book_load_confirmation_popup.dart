import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_outlined_text_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/rides/presentation/views/load_details/popups/view_reloads_popup.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';

class BookLoadConfirmationPopup extends ConsumerWidget {
  const BookLoadConfirmationPopup({
    required this.loadId,
    required this.cxt,
    super.key,
  });

  final int loadId;
  final BuildContext cxt;

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
            width: 224.w,
            height: 168.h,
            child: Assets.svgs.confirmBooking.svg(),
          ),
          30.hb,
          SizedBox(
            width: 268.w,
            child: AppText(
              text: context.appLocale.confirmBooking,
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
                onTap: () => GoRouter.of(context).pop(),
              ),
              AppFilledButton(
                width: 149,
                text: context.appLocale.yes,
                onTap: () async {
                  GoRouter.of(context).pop();

                  showModalBottomSheet<void>(
                    context: cxt,
                    showDragHandle: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r),
                      ),
                    ),
                    builder: (cxt) {
                      return ViewReloadsPopup(
                        loadId: loadId,
                      );
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
