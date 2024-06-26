import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/widgets/custom_text_form_field.dart';
import 'package:transport_management/util/resources/r.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      prefixIcon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Icon(
          Icons.search_rounded,
          size: 24.r,
          color: R.colors.grey_ABBED1,
        ),
      ),
      hintText: context.appLocale.searchHere,
      onChanged: (v) {
        //
      },
      labelText: '',
      keyboardType: TextInputType.text,
      validator: (v) {
        return null;
      },
    );
  }
}
