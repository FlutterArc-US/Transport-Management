import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/features/loads/presentation/views/delivery_details/widgets/reloads_widget.dart';
import 'package:transport_management/features/loads/presentation/views/load_details/widgets/all_reviews_widget.dart';
import 'package:transport_management/features/loads/presentation/views/pickup_details/widgets/additional_details_widget.dart';
import 'package:transport_management/features/loads/presentation/views/pickup_details/widgets/commodity_widget.dart';
import 'package:transport_management/features/loads/presentation/views/pickup_details/widgets/reference_number_widget.dart';
import 'package:transport_management/features/loads/presentation/views/pickup_details/widgets/shipper_notes_widget.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';

class DeliveryDetailsView extends StatelessWidget {
  const DeliveryDetailsView({super.key});

  void viewOnMap() {
    //
  }

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
                    text: context.appLocale.deliveryDetails,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    15.hb,
                    const Divider(),
                    15.hb,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: context.appLocale.bbDistributions,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: R.colors.blue_20B4E3,
                          ),
                          10.hb,
                          AppText(
                            text: '4851 Main St',
                            fontSize: 14,
                            color: R.colors.black_FF000000,
                          ),
                          4.hb,
                          Row(
                            children: [
                              AppText(
                                text: 'San Antonio, TX 75050',
                                fontSize: 14,
                                color: R.colors.black_FF000000,
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: viewOnMap,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                    vertical: 4.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: R.colors.navyBlue_263C51,
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 17.r,
                                        width: 17.r,
                                        child: Assets.svgs.viewOnMapIcon.svg(),
                                      ),
                                      4.wb,
                                      AppText(
                                        text: context.appLocale.viewOnMap,
                                        fontSize: 10,
                                        color: R.colors.white_FFFFFF,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    15.hb,
                    const Divider(),
                    5.hb,
                    const AllReviewsWidget(),
                    5.hb,
                    const Divider(),
                    15.hb,
                    const ShipperNotesWidget(),
                    15.hb,
                    const Divider(),
                    15.hb,
                    const ReferenceNumberWidget(),
                    15.hb,
                    const Divider(),
                    15.hb,
                    const CommodityWidget(),
                    15.hb,
                    const Divider(),
                    15.hb,
                    const AdditionalDetailsWidget(),
                    15.hb,
                    const Divider(),
                    15.hb,
                    const ReloadsWidget(),
                    42.hb,
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
