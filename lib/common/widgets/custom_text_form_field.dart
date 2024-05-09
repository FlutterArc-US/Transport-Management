import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.keyboardType,
    required this.validator,
    super.key,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.suffixIcon,
    this.focusNode,
    this.onSaved,
    this.onEditingComplete,
    this.controller,
    this.autofocus = false,
    this.enabled = true,
    this.onChanged,
    this.prefixIcon,
    this.onTap,
    this.minLine = 1,
    this.maxLines = 1,
    this.radius = 10,
    this.inputFormatters,
    this.fillColor = Colors.white,
    this.textInputAction = TextInputAction.next,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.readOnly = false,
    this.labelColor,
    this.textColor,
    this.width,
  });

  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final Color? fillColor;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onEditingComplete;
  final VoidCallback? onTap;
  final void Function(String?)? onChanged;
  final TextEditingController? controller;
  final bool autofocus;
  final bool enabled;
  final int maxLines;
  final int minLine;
  final double radius;
  final bool readOnly;
  final Color? labelColor;
  final Color? textColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Text(
            labelText!,
            style: TextStyle(
              fontSize: 15.sp,
              color: R.colors.black_FF000000,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.10.w,
            ),
          ),
        4.95.hb,
        Container(
          width: width?.w ?? 352.w,
          constraints: BoxConstraints(minHeight: 55.h),
          child: TextFormField(
            onTap: onTap,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: onChanged,
            autofocus: autofocus,
            enabled: enabled,
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            maxLines: maxLines,
            minLines: minLine,
            validator: validator,
            readOnly: readOnly,
            onSaved: onSaved,
            onEditingComplete: onEditingComplete,
            textInputAction: textInputAction,
            inputFormatters: inputFormatters,
            obscuringCharacter: '●',
            focusNode: focusNode,
            style: TextStyle(
              color: textColor ?? R.colors.black_FF000000,
              fontSize: 16.sp,
            ),
            cursorColor: R.colors.black_FF000000,
            cursorHeight: 20.sp,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
              prefixIcon: prefixIcon,
              hintText: hintText,
              hintStyle: TextStyle(
                color: !enabled
                    ? R.colors.grey_97A2B0.withOpacity(0.4)
                    : R.colors.grey_97A2B0,
                fontSize: 14.sp,
                letterSpacing: 0.12.w,
              ),
              errorStyle: TextStyle(
                fontSize: 12.sp,
                color: R.colors.red_DE2323,
              ),
              errorMaxLines: 2,
              filled: true,
              fillColor: fillColor ?? Colors.white,
              suffixIconConstraints: BoxConstraints(maxHeight: 24.r),
              prefixIconConstraints: BoxConstraints(maxHeight: 24.r),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: R.colors.red_DE2323),
                borderRadius: BorderRadius.circular(radius.r),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: R.colors.red_DE2323),
                borderRadius: BorderRadius.circular(radius.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: enabledBorderColor ?? R.colors.grey_AEAEAE),
                borderRadius: BorderRadius.circular(radius.r),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: R.colors.grey_97A2B0.withOpacity(0.4),
                ),
                borderRadius: BorderRadius.circular(radius.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius.r),
                borderSide: BorderSide(
                    color: focusedBorderColor ?? R.colors.navyBlue_263C51),
              ),
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
