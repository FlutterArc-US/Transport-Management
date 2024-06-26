import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/widgets/custom_text_form_field.dart';
import 'package:transport_management/util/resources/r.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({
    required this.onChanged,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.validator,
    this.focusNode,
    this.onEditingComplete,
    this.autofocus,
    this.fillColor,
    this.shadowColor,
    super.key,
  });

  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final bool? autofocus;
  final Color? fillColor;
  final Color? shadowColor;

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool obscureText = true;

  void onTapIcon() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      labelText: widget.labelText,
      hintText: widget.hintText,
      keyboardType: TextInputType.text,
      obscureText: obscureText,
      validator: widget.validator ??
          (v) {
            if (v?.isEmpty ?? true) {
              return 'Password is required';
            }
            if (v!.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
      onChanged: widget.onChanged,
      fillColor: widget.fillColor,
      suffixIcon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: InkWell(
          onTap: onTapIcon,
          borderRadius: BorderRadius.circular(22.r),
          child: Icon(
            obscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            size: 24.r,
            color:
                obscureText ? R.colors.grey_AEAEAE : R.colors.green_85C933,
          ),
        ),
      ),
      focusNode: widget.focusNode,
      onEditingComplete: widget.onEditingComplete,
      autofocus: widget.autofocus ?? false,
    );
  }
}
