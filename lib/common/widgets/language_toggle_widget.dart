import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/home/presentation/providers/language_provider/language_provider.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/main.dart';
import 'package:transport_management/util/resources/r.dart';

class LanguageToggleWidget extends ConsumerWidget {
  const LanguageToggleWidget({super.key});

  void selectLanguage(BuildContext context, String code) {
    if (code == 'gr') {
      MyApp.of(context)!.setLocale(
        const Locale.fromSubtags(languageCode: 'en'),
      );
    } else {
      MyApp.of(context)!.setLocale(
        const Locale.fromSubtags(languageCode: 'de'),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(appLanguageProvider);

    return InkWell(
      onTap: () {
        ref.read(appLanguageProvider.notifier).toggle();
        selectLanguage(context, language);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 100.w,
            height: 32.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: R.colors.navyBlue_263C51,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Assets.pngs.enLangIcon.image(
                        height: 20.r,
                      ),
                      2.wb,
                      AppText(
                        text: 'EN',
                        fontWeight: FontWeight.w600,
                        color: R.colors.white_FFFFFF,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Assets.pngs.grLangIcon.image(
                        height: 20.r,
                      ),
                      2.wb,
                      AppText(
                        text: 'GR',
                        fontWeight: FontWeight.w600,
                        color: R.colors.white_FFFFFF,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            left: language == 'en' ? 0 : 50.w,
            right: language == 'gr' ? 0 : 50.w,
            duration: const Duration(milliseconds: 300),
            child: Padding(
              padding: EdgeInsets.all(1.r),
              child: Container(
                width: 50.w,
                height: 30.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: R.colors.blue_20B4E3,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.w,
                    vertical: 5.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      language == 'en'
                          ? Assets.pngs.enLangIcon.image(
                              height: 20.r,
                            )
                          : Assets.pngs.grLangIcon.image(
                              height: 20.r,
                            ),
                      2.wb,
                      AppText(
                        text: language.toUpperCase(),
                        fontWeight: FontWeight.w600,
                        color: R.colors.white_FFFFFF,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
