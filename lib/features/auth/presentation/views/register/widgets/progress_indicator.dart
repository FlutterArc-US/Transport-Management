import 'package:transport_management/features/auth/presentation/providers/register_step_provider/register_step_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/total_steps_provider/total_steps_provider.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterProgressIndicator extends ConsumerWidget {
  const RegisterProgressIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final step = ref.watch(registerStepProvider);
    final totalSteps = ref.watch(totalStepsNotifierProvider);
    double width = 380.w / totalSteps;

    return Center(
      child: Container(
        width: 380.w,
        height: 7.h,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: R.colors.white_FFFFFF,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: AnimatedContainer(
          height: 7.h,
          width: width + (width * (step - 1)),
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: R.colors.blue_20B4E3,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
        ),
      ),
    );
  }
}
