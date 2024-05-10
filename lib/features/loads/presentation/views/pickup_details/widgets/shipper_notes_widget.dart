import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';

class ShipperNotesWidget extends StatelessWidget {
  const ShipperNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: context.appLocale.shipperNotes,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          13.hb,
          AppText(
            text: 'DO NOT LEAVE FACILITY WITHOUT EVERY PO # LISTED ON ORDER.\n'
                'Please notify Avcon 30 minutes before hitting detention (555) '
                '123-4567. *Detention will be paid after 3 hours.'
                'LOAD PO# 76X671234 FIRST @NOISE OF TRAILER\n'
                'this will be unloaded at second step.',
            fontSize: 14,
            height: 1.5.h,
          ),
        ],
      ),
    );
  }
}
