import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/util/resources/r.dart';

class PhoneNumberInputField extends StatelessWidget {
  const PhoneNumberInputField({
    required this.onChanged,
    this.onCountryChanged,
    this.isNotEmpty = true,
    this.focusNode,
    this.onEditingComplete,
    this.controller,
    this.initialCountryCode,
    super.key,
  });

  final void Function(PhoneNumber) onChanged;
  final void Function(Country)? onCountryChanged;
  final bool isNotEmpty;
  final FocusNode? focusNode;
  final void Function(String)? onEditingComplete;
  final TextEditingController? controller;
  final String? initialCountryCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.appLocale.phoneNumber,
          style: TextStyle(
            fontSize: 15.sp,
            color: R.colors.black_FF000000,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.10.w,
          ),
        ),
        4.95.hb,
        IntlPhoneField(
          keyboardType: Platform.isIOS
              ? const TextInputType.numberWithOptions(
                  signed: true,
                )
              : TextInputType.phone,
          inputFormatters: (Platform.isIOS)
              ? [
                  FilteringTextInputFormatter.digitsOnly,
                ]
              : null,
          textInputAction: TextInputAction.next,
          onSubmitted: onEditingComplete,
          controller: controller,
          focusNode: focusNode,
          autovalidateMode: AutovalidateMode.always,
          onCountryChanged: onCountryChanged,
          validator: (v) {
            if (v?.number.isEmpty ?? false) {
              return 'Please enter your phone number';
            }
            if (!v!.isValidNumber()) {
              return 'Invalid number';
            }
            return null;
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 12.h,
              horizontal: 16.w,
            ),
            border: InputBorder.none,
            errorText:
                (isNotEmpty) ? null : context.appLocale.enterYourPhoneNumber,
            counterText: "",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: R.colors.grey_AEAEAE),
              borderRadius: BorderRadius.circular(10.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: R.colors.navyBlue_263C51),
              borderRadius: BorderRadius.circular(10.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: R.colors.red_DE2323),
              borderRadius: BorderRadius.circular(10.r),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: R.colors.navyBlue_263C51),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          initialCountryCode: initialCountryCode ?? 'DE',
          cursorColor: R.colors.black_FF000000,
          flagsButtonPadding: EdgeInsets.only(bottom: 2.75.h),
          dropdownIcon: Icon(
            Icons.arrow_drop_down,
            color: R.colors.black_FF000000,
          ),
          dropdownTextStyle: TextStyle(
            fontSize: 16.sp,
            color: R.colors.black_FF000000,
          ),
          style: TextStyle(
            fontSize: 16.sp,
            color: R.colors.black_FF000000,
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
