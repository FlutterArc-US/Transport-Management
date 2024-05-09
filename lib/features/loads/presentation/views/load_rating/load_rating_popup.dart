import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/text_input_field.dart';
import 'package:transport_management/common/widgets/user_avatar.dart';
import 'package:transport_management/features/loads/presentation/views/load_details/popups/view_reloads_popup.dart';
import 'package:transport_management/features/loads/presentation/views/load_rating/widgets/rating_bar_widget.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoadRatingPopup extends ConsumerWidget {
  const LoadRatingPopup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () => GoRouter.of(context).pop(),
              child: Assets.svgs.closeIcon.svg(
                height: 32.r,
                width: 32.r,
              ),
            ),
          ),
        ),
        8.hb,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.w),
          child: Column(
            children: [
              SizedBox(
                width: 268.w,
                child: AppText(
                  text: context.appLocale.pickupExperience,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: R.colors.navyBlue_263C51,
                  textAlign: TextAlign.center,
                ),
              ),
              23.hb,
              const UserProfileAvatar(),
              21.hb,
              SizedBox(
                width: 268.w,
                child: AppText(
                  text: 'Fresh Springs Inc.',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: R.colors.navyBlue_263C51,
                  textAlign: TextAlign.center,
                ),
              ),
              2.hb,
              SizedBox(
                width: 268.w,
                child: AppText(
                  text: 'Houston, TX',
                  fontSize: 12,
                  color: R.colors.navyBlue_263C51,
                  textAlign: TextAlign.center,
                ),
              ),
              15.hb,
              const RatingBarWidget(),
              13.hb,
              SizedBox(
                width: 268.w,
                child: AppText(
                  text: 'It was okay',
                  fontSize: 12,
                  color: R.colors.navyBlue_263C51,
                  textAlign: TextAlign.center,
                ),
              ),
              25.hb,
              TextInputField(
                onChanged: (v) {},
                hintText: 'Clean, professional on time',
                maxLines: 4,
                minLines: 4,
              ),
            ],
          ),
        ),
        const Spacer(),
        AppFilledButton(
          width: 300,
          text: context.appLocale.ratePickup,
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
                return const ViewReloadsPopup(loadId: 1);
              },
            );
          },
        ),
        29.hb,
      ],
    );
  }
}
