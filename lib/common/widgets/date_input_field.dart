import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:transport_management/common/widgets/custom_text_form_field.dart';
import 'package:transport_management/util/resources/r.dart';

class DateInputField extends StatefulWidget {
  const DateInputField({
    required this.labelText,
    required this.hintText,
    this.onChanged,
    this.controller,
    this.validator,
    this.dateFormat,
    super.key,
  });

  final void Function(String?)? onChanged;
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? dateFormat;

  @override
  State<DateInputField> createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  final dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: widget.labelText,
      hintText: widget.hintText,
      suffixIcon: Padding(
        padding: EdgeInsets.only(right: 19.w),
        child: Icon(
          Icons.calendar_month_outlined,
          color: R.colors.green_337A34,
        ),
      ),
      onTap: () async {
        final dateSelected = await showDatePicker(
          context: context,
          firstDate: DateTime(1990),
          lastDate: DateTime(2070),
        );

        final formattedDate =
            DateFormat(widget.dateFormat ?? 'dd-MM-yyyy').format(dateSelected!);
        dateInput.text = formattedDate;
        widget.onChanged!(dateInput.text);
      },
      controller: dateInput,
      keyboardType: TextInputType.name,
      validator: widget.validator ??
          (v) {
            if (v?.isEmpty ?? false) {
              return '${widget.labelText} is required';
            }
            return null;
          },
      onChanged: (v) async {
        final dateSelected = await showDatePicker(
          context: context,
          firstDate: DateTime(1990),
          lastDate: DateTime(2070),
        );

        final formattedDate = DateFormat('dd-MM-yyyy').format(dateSelected!);
        dateInput.text = formattedDate;
        widget.onChanged!(dateInput.text);
      },
    );
  }
}
