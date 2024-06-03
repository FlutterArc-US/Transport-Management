import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/custom_text_form_field.dart';
import 'package:transport_management/gen/assets.gen.dart';
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

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showModalBottomSheet<DateTime>(
      scrollControlDisabledMaxHeightRatio: 0.55,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      builder: (BuildContext context) {
        DateTime selectedDate = DateTime.now();
        return Column(
          children: [
            12.hb,
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: InkWell(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  child: Assets.svgs.closeIcon.svg(),
                ),
              ),
            ),
            AppText(
              text: context.appLocale.selectType,
              fontWeight: FontWeight.w600,
              fontSize: 25,
            ),
            12.hb,
            Expanded(
              child: Theme(
                data: ThemeData.light().copyWith(
                  primaryColor: R.colors.green_85C933,
                  colorScheme: ColorScheme.light(
                    primary: R.colors.green_85C933,
                  ),
                  dialogBackgroundColor: R.colors.white_FFFFFF,
                ),
                child: CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1990),
                  lastDate: DateTime(2070),
                  onDateChanged: (DateTime date) {
                    selectedDate = date;
                    final formattedDate =
                        DateFormat(widget.dateFormat ?? 'dd-MM-yyyy')
                            .format(date);
                    dateInput.text = formattedDate;
                    widget.onChanged!(dateInput.text);
                    GoRouter.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

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
        selectDate(context);
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
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.light().copyWith(
                primaryColor: Colors.green, // Header background color
                colorScheme: ColorScheme.light(primary: Colors.green),
                dialogBackgroundColor:
                    Colors.white, // Background color of the dialog
              ),
              child: child!,
            );
          },
        );
        final formattedDate = DateFormat('dd-MM-yyyy').format(dateSelected!);
        dateInput.text = formattedDate;
        widget.onChanged!(dateInput.text);
      },
    );
  }
}
