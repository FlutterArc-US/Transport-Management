import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length < oldValue.text.length) {
      int offset = newValue.selection.baseOffset;
      if (offset < oldValue.text.length && oldValue.text[offset] == '-') {
        return TextEditingValue(
          text: oldValue.text.replaceRange(offset - 1, offset, ''),
          selection: TextSelection.collapsed(offset: offset - 1),
        );
      }
    }

    final StringBuffer newText = StringBuffer();
    final String value = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (value.length >= 2) {
      newText.write('${value.substring(0, 2)}-');
      if (value.length >= 4) {
        newText.write('${value.substring(2, 4)}-');
        if (value.length >= 8) {
          newText.write(value.substring(4, 8));
        } else {
          newText.write(value.substring(4));
        }
      } else {
        newText.write(value.substring(2));
      }
    } else {
      newText.write(value);
    }
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
