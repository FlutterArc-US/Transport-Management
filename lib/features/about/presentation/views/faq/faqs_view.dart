import 'package:avcons/common/extensions/app_localization.dart';
import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/common/widgets/back_button_widget.dart';
import 'package:avcons/features/about/presentation/providers/faq_provider.dart';
import 'package:avcons/features/about/presentation/views/faq/widgets/faq_tile_widget.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqsView extends ConsumerWidget {
  const FaqsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaPadding = MediaQuery.of(context).padding;
    final faqList = ref.watch(faqListProvider);

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

            /// [Back button]
            BackButtonWidget(
              color: R.colors.black_FF000000,
            ),
            10.hb,

            /// [Title]
            Center(
              child: AppText(
                text: context.appLocale.faqs,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: R.colors.black_1E1E1E,
              ),
            ),
            19.hb,

            /// [Faqs list]
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 25.w,
                  vertical: 10.h,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final faq = faqList[index];
                  return FaqTileWidget(
                    title: faq.title,
                    description: faq.description,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return 20.hb;
                },
                itemCount: faqList.length,
              ),
            ),
            mediaPadding.bottom.hb,
          ],
        ),
      ),
    );
  }
}
