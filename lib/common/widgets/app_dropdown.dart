import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/util/resources/r.dart';

class AppDropdownWidget<T extends Object?> extends StatefulWidget {
  const AppDropdownWidget({
    required this.onChanged,
    required this.labelText,
    required this.title,
    required this.items,
    required this.hint,
    this.value,
    this.color,
    this.borderColor,
    this.fontSize,
    super.key,
  });

  final void Function(T? value) onChanged;
  final String Function(T? value) title;
  final List<T> items;
  final String hint;
  final Color? color;
  final Color? borderColor;
  final T? value;
  final double? fontSize;
  final String labelText;

  @override
  State<AppDropdownWidget> createState() => _AppDropdownWidgetState<T>();
}

class _AppDropdownWidgetState<T extends Object?>
    extends State<AppDropdownWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
            fontSize: 15.sp,
            color: R.colors.black_FF000000,
            letterSpacing: 0.10.w,
          ),
        ),
        4.95.hb,
        Container(
          constraints: BoxConstraints(minHeight: 40.h, maxWidth: 352.w),
          padding: EdgeInsets.only(
            left: 12.w,
            right: 12.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: widget.borderColor ?? R.colors.grey_AEAEAE,
            ),
            color: widget.color ?? Colors.white,
          ),
          child: DropdownButton<T?>(
            value: widget.value,
            borderRadius: BorderRadius.circular(10.r),
            hint: Text(
              widget.hint,
              style: TextStyle(
                fontSize: 14.sp,
                color: R.colors.grey_AEAEAE,
              ),
            ),
            underline: const SizedBox(),
            isExpanded: true,
            icon: Icon(
              Icons.keyboard_arrow_down_outlined,
              color: R.colors.green_337A34,
            ),
            elevation: 16,
            style: TextStyle(color: R.colors.black_FF000000),
            onChanged: (T? value) {
              widget.onChanged.call(value);
            },
            items: widget.items.map<DropdownMenuItem<T>>((T value) {
              return DropdownMenuItem<T>(
                value: value,
                child: Text(
                  widget.title(value),
                  style: TextStyle(fontSize: 16.sp),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
