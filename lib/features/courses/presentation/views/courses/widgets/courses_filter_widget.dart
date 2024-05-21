import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/courses/presentation/providers/selected_filters_provider/selected_filters_provider.dart';
import 'package:transport_management/util/resources/r.dart';

class CoursesFilterWidget extends ConsumerWidget {
  const CoursesFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilters = ref.watch(selectedFiltersProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: Row(
          children: List.generate(
            10,
            (index) {
              return InkWell(
                onTap: () {
                  ref.read(selectedFiltersProvider.notifier).update(index);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: R.colors.green_337A34),
                    color: selectedFilters.contains(index)
                        ? R.colors.green_337A34
                        : R.colors.white_FFFFFF,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.filter_alt_outlined,
                        color: selectedFilters.contains(index)
                            ? R.colors.white_FFFFFF
                            : R.colors.green_337A34,
                        size: 16,
                      ),
                      AppText(
                        text: 'Category ${index + 1}',
                        fontWeight: FontWeight.w600,
                        color: selectedFilters.contains(index)
                            ? R.colors.white_FFFFFF
                            : R.colors.green_337A34,
                        height: 0,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
