
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/features/about/presentation/views/about/widgets/about_content_widget.dart';
import 'package:transport_management/features/about/presentation/views/about/widgets/sliver_persistance_header.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/router/paths.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  late final ScrollController scrollController;
  bool isVisible = true;

  void scrollListener() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      setState(() {
        isVisible = false;
      });
    } else if (scrollController.position.userScrollDirection ==
            ScrollDirection.forward &&
        scrollController.position.pixels !=
            scrollController.position.maxScrollExtent) {
      setState(() {
        isVisible = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

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
                text: context.appLocale.about,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: R.colors.black_1E1E1E,
              ),
            ),
            15.hb,
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: CustomScrollView(
                      controller: scrollController,
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

                        /// [About text]
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              15.hb,
                              const AboutTextWidget(),
                              200.hb,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// [Privacy policy and terms of service button]
                  AnimatedPositioned(
                    bottom: isVisible ? 28.h : 0,
                    duration: const Duration(milliseconds: 250),
                    child: Container(
                      height: 170.h,
                      width: 1.sw,
                      color: R.colors.white_FFFFFF,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          36.hb,
                          AppFilledButton(
                            width: 300,
                            text: context.appLocale.termsOfService,
                            onTap: () {
                              GoRouter.of(context)
                                  .push(RoutePaths.termsOfService);
                            },
                          ),
                          10.hb,
                          AppFilledButton(
                            width: 300,
                            text: context.appLocale.privacyPolicy,
                            onTap: () {
                              GoRouter.of(context)
                                  .push(RoutePaths.privacyPolicy);
                            },
                          ),
                          36.hb,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            mediaPadding.top.hb,
          ],
        ),
      ),
    );
  }
}
