import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/util/resources/r.dart';

class OTPField extends StatelessWidget {
  const OTPField({
    required this.node,
    required this.index,
    required this.controller,
    Key? key,
    this.onChanged,
  }) : super(key: key);

  final int index;
  final FocusNode node;
  final void Function(String, int)? onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 70.w,
      padding: EdgeInsets.only(right: 14.r),
      child: AspectRatio(
        aspectRatio: 1.55.w,
        child: TextFormField(
          autofocus: true,
          focusNode: node,
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return '';
            }
            return null;
          },
          onChanged: (value) {
            if (onChanged != null) {
              onChanged!(value, index);
            }
          },
          showCursor: false,
          enableInteractiveSelection: false,
          style: TextStyle(
            fontSize: 16.sp,
            color: R.colors.blue_20B4E3,
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(
              RegExp('^[0-9]'),
            )
          ],
          maxLength: 1,
          decoration: InputDecoration(
            focusColor: R.colors.blue_20B4E3,
            counter: const Offstage(),
            border: const UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: R.colors.grey_97A2B0),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: R.colors.blue_20B4E3,
                width: 1.2.w,
              ),
            ),
            hintText: '0',
          ),
        ),
      ),
    );
  }
}
