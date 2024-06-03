import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/home/presentation/views/widgets/search_bar_widget.dart';
import 'package:transport_management/features/record_matter/presentation/providers/record_matter_form_provider/record_matter_form_provider.dart';
import 'package:transport_management/features/record_matter/presentation/providers/report_expense_types_data_provider/report_expense_types_data_provider.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';

class SelectTypeSheet extends ConsumerWidget {
  const SelectTypeSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final types = ref.watch(reportExpenseTypesDataProvider);
    final recordMatterForm = ref.watch(recordMatterFormProvider);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 27.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  child: Assets.svgs.closeIcon.svg(),
                ),
              ),
              AppText(
                text: context.appLocale.selectType,
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
              12.hb,
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SearchBarWidget(),
                      16.hb,
                      AppText(
                        text: context.appLocale.allCategories,
                        fontSize: 12,
                        color: R.colors.grey_6A6A6A,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                16.hb,
                Column(
                  children: List.generate(
                    types.length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          ref
                              .read(recordMatterFormProvider.notifier)
                              .setType(types[index]);
                          GoRouter.of(context).pop();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 27.w),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: R.colors.green_CFF07B,
                                  radius: 18.r,
                                  child: Icon(
                                    Icons.miscellaneous_services,
                                    color: R.colors.black_FF000000,
                                    size: 20.r,
                                  ),
                                ),
                                8.wb,
                                AppText(
                                  text: types[index],
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                                const Spacer(),
                                Icon(
                                  recordMatterForm.type == types[index]
                                      ? Icons.radio_button_on
                                      : Icons.radio_button_off,
                                  size: 18.r,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
