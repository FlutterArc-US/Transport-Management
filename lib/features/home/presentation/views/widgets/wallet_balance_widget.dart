import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/gen/assets.gen.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletBalanceWidget extends StatelessWidget {
  const WalletBalanceWidget({
    required this.balance,
    super.key,
  });

  final double balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.w,
      height: 38.h,
      decoration: BoxDecoration(
        color: R.colors.navyBlue_263C51,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          bottomLeft: Radius.circular(10.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Assets.svgs.walletIcon.svg(),
          AppText(
            text: '€ $balance',
            color: R.colors.white_FFFFFF,
            fontSize: 22,
          ),
        ],
      ),
    );
  }
}
