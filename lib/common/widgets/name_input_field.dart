import 'package:flutter/material.dart';
import 'package:transport_management/common/widgets/custom_text_form_field.dart';

class NameInputField extends StatelessWidget {
  const NameInputField({
    required this.onChanged,
    required this.hintText,
    this.labelText,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.width,
    this.shadowColor,
    this.focusNode,
    this.onEditingComplete,
    this.onTap,
    super.key,
  });

  final void Function(String?)? onChanged;
  final String? labelText;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final double? width;
  final Color? shadowColor;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: labelText,
      hintText: hintText,
      controller: controller,
      focusNode: focusNode,
      keyboardType: TextInputType.name,
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      validator: validator ??
          (value) {
            final RegExp nameRegExp = RegExp(r'^[a-zA-Z\- ]+$');

            if (value?.isEmpty ?? true) {
              return 'Please enter your $labelText';
            }
            if (value!.length > 50) {
              return '$labelText cannot exceed 50 characters';
            }
            if (!nameRegExp.hasMatch(value)) {
              return '$labelText can only contain letters, spaces, and dashes';
            }
            if (value.contains(RegExp(r'\s{2,}'))) {
              return 'Please enter only one space at a time';
            }

            return null;
          },
      onChanged: onChanged,
      suffixIcon: suffixIcon,
    );
  }
}
