import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactWigdet extends StatelessWidget {
  const ContactWigdet({
    required this.icon,
    required this.title,
    required this.contact,
    super.key,
  });

  final Widget icon;
  final String title;
  final String contact;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        color: R.colors.grey_F8F8F8,
      ),
      padding: EdgeInsets.all(15.r),
      child: Row(
        children: [
          SizedBox(
            height: 26.r,
            width: 26.r,
            child: icon,
          ),
          19.wb,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: title,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: R.colors.black_FF000000,
              ),
              3.hb,
              AppText(
                text: contact,
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: R.colors.black_FF000000,
              ),
            ],
          )
        ],
      ),
    );
  }
}
