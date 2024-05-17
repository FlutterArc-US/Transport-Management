import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/features/rides/domain/models/load/load_model.dart';
import 'package:transport_management/features/rides/presentation/views/rides/widgets/ride_card_widget.dart';
import 'package:transport_management/util/resources/r.dart';

class RideDetailsView extends StatelessWidget {
  const RideDetailsView({this.load, super.key});

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
              child: AppText(
                text: context.appLocale.tripDetails,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            10.hb,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 850.h,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            height: 431.h,
                            color: R.colors.grey_767680.withOpacity(0.2),
                          ),
                          Positioned(
                            bottom: 32.h,
                            child: const RideCardWidget(),
                          ),
                        ],
                      ),
                    ),
                    24.hb,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
