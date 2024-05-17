import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/features/auth/domain/models/login_option_model/login_option_model.dart';
import 'package:transport_management/features/auth/presentation/providers/login_option_provider/login_option_provider.dart';
import 'package:transport_management/util/resources/r.dart';

class LoginOptionTab extends ConsumerStatefulWidget {
  const LoginOptionTab({super.key});

  @override
  ConsumerState createState() => _LoginOptionTabState();
}

class _LoginOptionTabState extends ConsumerState<LoginOptionTab> {
  String loginOptionText(LoginOptionModel option) {
    return switch (option) {
      LoginOptionModel.viaPhoneNumber => context.appLocale.viaPhoneNumber,
      LoginOptionModel.viaDriverLicense => context.appLocale.viaDrivingLicense,
    };
  }

  @override
  Widget build(BuildContext context) {
    final loginOption = ref.watch(loginOptionProvider);
    return Column(
      children: [
        Container(
          width: 340.w,
          height: 44.h,
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
          decoration: BoxDecoration(
            color: R.colors.grey_767680.withOpacity(0.12),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(LoginOptionModel.values.length, (index) {
                final option = LoginOptionModel.values[index];
                return InkWell(
                  onTap: () {
                    ref.read(loginOptionProvider.notifier).state =
                        LoginOptionModel.values[index];
                  },
                  child: Container(
                    width: 165.w,
                    height: 38.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: loginOption == option
                          ? R.colors.white_FFFFFF
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      loginOptionText(option),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: loginOption == option
                            ? FontWeight.w600
                            : FontWeight.w400,
                        color: loginOption == option
                            ? R.colors.navyBlue_263C51
                            : R.colors.grey_767680,
                      ),
                    ),
                  ),
                );
              })),
        ),
      ],
    );
  }
}
