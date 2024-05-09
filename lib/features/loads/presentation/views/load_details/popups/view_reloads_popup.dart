import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_outlined_text_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/loads/presentation/providers/book_load_provider/book_load_provider.dart';
import 'package:transport_management/features/loads/presentation/views/load_details/popups/load_booked_success_popup.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/exceptions/message_exception.dart';
import 'package:transport_management/util/loading/loading.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ViewReloadsPopup extends ConsumerWidget {
  const ViewReloadsPopup({required this.loadId, super.key});

  final int loadId;

  Future<void> _bookLoad(BuildContext context, WidgetRef ref) async {
    try {
      loading(context);
      await ref.read(bookLoadProvider(loadId).future);

      if (!context.mounted) return;
      GoRouter.of(context).pop();

      showModalBottomSheet<void>(
        context: context,
        showDragHandle: true,
        scrollControlDisabledMaxHeightRatio: 0.48,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        builder: (context) {
          return const LoadBookedSuccessPopup();
        },
      );
    } on MessageException catch (e) {
      showToast(msg: e.message);
    } catch (e) {
      showToast(msg: e.toString());
      // showToast(msg: AppLocalizations.of(context)!.somethingWentWrong);
    } finally {
      dismissLoading();
    }
  }

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
            child: Assets.pngs.loadBookingImg.image(),
          ),
          30.hb,
          SizedBox(
            width: 268.w,
            child: AppText(
              text: context.appLocale.loadBooking,
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: R.colors.navyBlue_263C51,
              textAlign: TextAlign.center,
            ),
          ),
          13.hb,
          SizedBox(
            width: 313.w,
            child: AppText(
              text: context.appLocale.dropOffLocation,
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
                text: context.appLocale.no,
                onTap: () => _bookLoad(context, ref),
              ),
              AppFilledButton(
                width: 149,
                text: context.appLocale.viewReloads,
                onTap: () {},
              ),
            ],
          ),
          29.hb,
        ],
      ),
    );
  }
}
