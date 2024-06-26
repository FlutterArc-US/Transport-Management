import 'package:flutter/material.dart';
import 'package:transport_management/common/widgets/custom_text_form_field.dart';

class NumberInputField extends StatelessWidget {
  const NumberInputField({
    required this.onChanged,
    this.controller,
    this.validator,
    this.autofocus,
    this.focusNode,
    this.onEditingComplete,
    this.hintText,
    this.labelText,
    this.shadowColor,
    this.enabled = true,
    this.fillColor,
    super.key,
  });

  final void Function(String?)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? autofocus;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final String? hintText;
  final String? labelText;
  final Color? shadowColor;
  final bool enabled;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: labelText ?? '',
      hintText: hintText ?? '',
      controller: controller,
      enabled: enabled,
      keyboardType: TextInputType.number,
      validator: validator ??
          (v) {
            if (v?.isEmpty ?? false) {
              return '$labelText is required';
            }
            return null;
          },
      onChanged: onChanged,
      autofocus: autofocus ?? false,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      fillColor: fillColor,
    );
  }
}
