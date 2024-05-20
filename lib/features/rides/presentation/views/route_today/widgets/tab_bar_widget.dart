import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/util/resources/r.dart';

class TabBarWidget<T> extends ConsumerWidget {
  const TabBarWidget({
    required this.selected,
    required this.itemsList,
    required this.onChanged,
    required this.itemNames,
    super.key,
  });

  final List<T> itemsList;
  final List<String> itemNames;
  final int selected;
  final void Function(int) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 340.w,
      height: 44.h,
      padding: EdgeInsets.symmetric(
        horizontal: 4.w,
        vertical: 2.h,
      ),
      decoration: BoxDecoration(
        color: R.colors.grey_767680.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          itemsList.length,
          (index) {
            return InkWell(
              borderRadius: BorderRadius.circular(10.r),
              onTap: () => onChanged(index),
              child: Container(
                width: 330.w * (1 / itemsList.length),
                height: 38.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: index == selected
                      ? R.colors.white_FFFFFF
                      : R.colors.grey_767680.withOpacity(0),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  itemNames[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
