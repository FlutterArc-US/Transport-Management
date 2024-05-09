import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_outlined_text_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/loads/presentation/providers/submitted_docs_provider/submitted_docs_provider.dart';
import 'package:transport_management/features/loads/presentation/views/pretrip/popups/upload_image_popup.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class UploadPODPopup extends ConsumerWidget {
  const UploadPODPopup({super.key});

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
          12.hb,
          SizedBox(
            width: 165.w,
            height: 175.h,
            child: Assets.svgs.podDocIcon.svg(),
          ),
          26.hb,
          SizedBox(
            width: 268.w,
            child: AppText(
              text: context.appLocale.loadDelivered,
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: R.colors.navyBlue_263C51,
              textAlign: TextAlign.center,
            ),
          ),
          13.hb,
          SizedBox(
            width: 268.w,
            child: AppText(
              text: context.appLocale.uploadPOD,
              fontSize: 14,
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
                text: context.appLocale.notNow,
                onTap: () {
                  GoRouter.of(context).pop();
                },
              ),
              AppFilledButton(
                width: 149,
                text: context.appLocale.uploadPod,
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
                      return UploadImagePopup(
                        onCameraClick: (v) {
                          ref.read(submittedDocsProvider.notifier).add(v);
                        },
                        onMultipleGalleryClick: (v) {
                          ref
                              .read(submittedDocsProvider.notifier)
                              .addMultiple(v);

                          if (!context.mounted) return;

                          GoRouter.of(context).push(RoutePaths.submittedDocs);
                        },
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
