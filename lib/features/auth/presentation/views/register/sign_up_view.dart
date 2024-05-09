import 'dart:async';

import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/features/auth/presentation/providers/driver_provider/driver_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/register/register_form_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/register_step_provider/register_step_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/total_steps_provider/total_steps_provider.dart';
import 'package:transport_management/features/auth/presentation/views/register/widgets/account_under_verification_step.dart';
import 'package:transport_management/features/auth/presentation/views/register/widgets/enter_phone_number_step.dart';
import 'package:transport_management/features/auth/presentation/views/register/widgets/personal_details_step.dart';
import 'package:transport_management/features/auth/presentation/views/register/widgets/phone_number_verification_step.dart';
import 'package:transport_management/features/auth/presentation/views/register/widgets/profile_type_step.dart';
import 'package:transport_management/features/auth/presentation/views/register/widgets/progress_indicator.dart';
import 'package:transport_management/features/auth/presentation/views/register/widgets/vehicle_type_step.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  bool isChecked = false;

  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      _getCurrentUser();
    });
  }

  Future<void> _getCurrentUser() async {
    final driver = await ref.read(driverProvider.future);
    if (driver != null && driver.status == 'pending') {
      ref.read(registerStepProvider.notifier).state = 6;
      _pageController.animateToPage(
        6,
        duration: const Duration(milliseconds: 1),
        curve: Curves.linear,
      );
    }
  }

  void _next() {
    final steps = ref.read(totalStepsNotifierProvider);

    ref.read(registerStepProvider.notifier).next(steps);

    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  void _back() {
    ref.read(registerStepProvider.notifier).prev();
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    final step = ref.watch(registerStepProvider);
    final registerForm = ref.watch(registerFormProvider);
    final totalSteps = ref.watch(totalStepsNotifierProvider);

    return PopScope(
      canPop: step == 1 ? true : false,
      onPopInvoked: (v) async {
        if (step == totalSteps) {
          GoRouter.of(context).go(RoutePaths.welcome);

          return;
        }
        _back();
      },
      child: Scaffold(
        body: KeyboardDismissOnTap(
          child: SingleChildScrollView(
            child: SizedBox(
              width: 1.sw,
              height: 1.sh,
              child: Stack(
                children: [
                  Container(
                    width: 1.sw,
                    height: 1.sh,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Assets.pngs.authBg.path),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        34.hb,
                        if (step != totalSteps)
                          BackButtonWidget(
                            color: R.colors.white_FFFFFF,
                            onTap: () {
                              if (step == 1) {
                                GoRouter.of(context).pop();
                              } else {
                                _back();
                              }
                            },
                          ),
                        32.hb,
                        Assets.svgs.appLogo.svg(
                          width: 165.w,
                          height: 50.h,
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Stack(
                            children: [
                              Container(
                                width: 1.sw,
                                height: 688.h,
                                decoration: BoxDecoration(
                                  color: R.colors.white_FFFFFF,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.r),
                                    topRight: Radius.circular(20.r),
                                  ),
                                ),
                              ),
                              const RegisterProgressIndicator(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 133,
                    left: 0,
                    right: 0,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          13.hb,
                          Padding(
                            padding: EdgeInsets.only(top: 31.h),
                            child: SizedBox(
                              height: 650.h,
                              child: PageView(
                                physics: const NeverScrollableScrollPhysics(),
                                controller: _pageController,
                                children: [
                                  EnterPhoneNumberStep(onTap: _next),
                                  PhoneNumberVerificationStep(
                                    onTap: _next,
                                  ),
                                  ProfileTypeStepWidget(
                                    onTap: _next,
                                  ),
                                  if (registerForm.typeId == 2) // own vehicle
                                    VehicleTypeStepWidget(
                                      onTap: _next,
                                    ),
                                  PersonalDetailsStep(
                                    onTap: _next,
                                  ),
                                  const AccountUnderVerificationStepWidget(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
