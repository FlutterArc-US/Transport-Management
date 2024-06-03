import 'package:flutter/material.dart';
import 'package:transport_management/common/widgets/custom_text_form_field.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    required this.onChanged,
    required this.hintText,
    this.labelText,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.focusNode,
    this.onEditingComplete,
    this.autofocus,
    this.maxLines,
    this.minLines,
    this.hintStyle,
    this.enabled = true,
    super.key,
  });

  final void Function(String?)? onChanged;
  final String? labelText;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final bool? autofocus;
  final int? minLines;
  final int? maxLines;
  final TextStyle? hintStyle;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: labelText,
      hintText: hintText,
      controller: controller,
      keyboardType: TextInputType.text,
      validator: validator,
      onChanged: onChanged,
      suffixIcon: suffixIcon,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      autofocus: autofocus ?? false,
      minLine: minLines ?? 1,
      maxLines: maxLines ?? 1,
      hintStyle: hintStyle,
      enabled: enabled,
    );
  }
}
