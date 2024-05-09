import 'package:avcons/common/extensions/app_localization.dart';
import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/common/widgets/app_filled_button.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/common/widgets/back_button_widget.dart';
import 'package:avcons/features/loads/domain/models/load/load_model.dart';
import 'package:avcons/features/loads/presentation/views/load_details/popups/book_load_confirmation_popup.dart';
import 'package:avcons/features/loads/presentation/views/load_details/widgets/load_info_card_widget.dart';
import 'package:avcons/features/loads/presentation/views/load_details/widgets/load_pickup_delivery_card_widget.dart';
import 'package:avcons/features/loads/presentation/views/load_details/widgets/map_widget.dart';
import 'package:avcons/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadDetailsView extends StatelessWidget {
  const LoadDetailsView({this.load, super.key});

  final LoadModel? load;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Column(
          children: [
            MediaQuery.of(context).padding.top.hb,
            const BackButtonWidget(),
            14.hb,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  21.wb,
                  AppText(
                    text: context.appLocale.loadDetails,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  Assets.svgs.shareIcon.svg(
                    height: 21.r,
                    width: 21.r,
                  ),
                ],
              ),
            ),
            10.hb,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const MapWidget(),
                    15.hb,
                    LoadPickupDeliveryCardWidget(load: load),
                    15.hb,
                    const LoadInfoCardWidget(),
                    22.hb,
                    AppFilledButton(
                      text: context.appLocale.bookLoad,
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          showDragHandle: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.r),
                              topRight: Radius.circular(30.r),
                            ),
                          ),
                          builder: (_) {
                            return BookLoadConfirmationPopup(
                              loadId: load?.id ?? 1,
                              cxt: context,
                            );
                          },
                        );
                      },
                    ),
                    24.hb,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
