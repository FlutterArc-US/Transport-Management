import 'package:avcons/common/extensions/app_localization.dart';
import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/common/widgets/app_filled_button.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/common/widgets/back_button_widget.dart';
import 'package:avcons/features/about/domain/models/faq_model.dart';
import 'package:avcons/features/about/presentation/views/faq/widgets/faq_tile_widget.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SingleFaqView extends StatelessWidget {
  const SingleFaqView({
    required this.faqModel,
    super.key,
  });

  final FaqModel faqModel;

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
                text: context.appLocale.faq,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: R.colors.black_1E1E1E,
              ),
            ),
            19.hb,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: FaqTileWidget(
                title: faqModel.title,
                description: faqModel.description,
                showFull: true,
              ),
            ),
            const Spacer(),
            Center(
              child: AppFilledButton(
                width: 300,
                text: context.appLocale.backToFaq,
                onTap: () {
                  GoRouter.of(context).pop();
                },
              ),
            ),
            mediaPadding.top.hb,
          ],
        ),
      ),
    );
  }
}
