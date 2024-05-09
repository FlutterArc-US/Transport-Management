import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/features/about/presentation/views/about/widgets/about_content_widget.dart';
import 'package:transport_management/features/about/presentation/views/about/widgets/sliver_persistance_header.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';

class TermsOfServiceView extends StatelessWidget {
  const TermsOfServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaPadding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: R.colors.white_FFFFFF,
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mediaPadding.top.hb,
            28.hb,
            BackButtonWidget(
              color: R.colors.black_FF000000,
            ),
            10.hb,
            Center(
              child: AppText(
                text: context.appLocale.termsOfService,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: R.colors.black_1E1E1E,
              ),
            ),
            15.hb,
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    /// [App Image]
                    SliverPersistentHeader(
                      delegate: SliverAppBarDelegate(
                        minHeight: 0,
                        maxHeight: 256.h,
                        child: Assets.pngs.aboutImage.image(width: 335),
                      ),
                    ),

                    /// [Privacy Policy text]
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          15.hb,
                          const AboutTextWidget(),
                          45.hb,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            mediaPadding.top.hb,
          ],
        ),
      ),
    );
  }
}
