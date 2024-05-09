import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/auth/domain/models/profile_type/profile_type.dart';
import 'package:transport_management/features/auth/presentation/providers/register/register_form_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/register_step_provider/register_step_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/total_steps_provider/total_steps_provider.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileTypeStepWidget extends ConsumerWidget {
  const ProfileTypeStepWidget({required this.onTap, super.key});

  final VoidCallback onTap;

  String typeName(BuildContext context, ProfileTypeModel type) {
    if (type.isDriver) {
      return context.appLocale.driver;
    } else {
      return context.appLocale.ownVehicle;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerForm = ref.watch(registerFormProvider);
    final step = ref.watch(registerStepProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 29.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: AppText(
              text: context.appLocale.stepNumber(step),
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
          10.hb,
          Align(
            alignment: Alignment.centerLeft,
            child: AppText(
              text: context.appLocale.chooseProfileType,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          40.hb,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              ProfileTypeModel.values.length,
              (index) {
                final type = ProfileTypeModel.values[index];
                final isSelected = type.id == registerForm.typeId;

                return InkWell(
                  onTap: () {
                    ref.read(registerFormProvider.notifier).setTypeId(type.id);
                  },
                  child: Container(
                    width: 132.r,
                    height: 132.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(
                        color: isSelected
                            ? R.colors.navyBlue_263C51
                            : R.colors.grey_CBE2EF,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          right: 6.w,
                          top: 6.h,
                          child: Icon(
                            isSelected
                                ? Icons.check_circle
                                : Icons.circle_outlined,
                            color: isSelected
                                ? R.colors.navyBlue_263C51
                                : R.colors.grey_CBE2EF,
                          ),
                        ),
                        Positioned(
                          top: 15.53.h,
                          child: SvgPicture.asset(
                            type.svgPath,
                            colorFilter: ColorFilter.mode(
                              isSelected
                                  ? R.colors.navyBlue_263C51
                                  : R.colors.grey_CBE2EF,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 4.h,
                          child: AppText(
                            text: typeName(context, type),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? R.colors.navyBlue_263C51
                                : R.colors.grey_CBE2EF,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          30.hb,
          SizedBox(
            width: 282.w,
            height: 60.h,
            child: AppText(
              text: registerForm.typeId == 2
                  ? context.appLocale.vehicleOwnershipAndBookingAuthority
                  : context.appLocale.vehicleOwnershipAndBooking,
              color: R.colors.black_42403F,
              textAlign: TextAlign.center,
            ),
          ),
          200.hb,
          Center(
            child: AppFilledButton(
              text: 'Next',
              onTap: () {
                if (registerForm.typeId == 1) {
                  ref.read(totalStepsNotifierProvider.notifier).state = 5;
                }

                onTap();
              },
            ),
          )
        ],
      ),
    );
  }
}
