import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/text_input_field.dart';
import 'package:transport_management/features/auth/presentation/providers/register/register_form_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/register_step_provider/register_step_provider.dart';
import 'package:transport_management/features/auth/presentation/providers/vehicle_models_provider/vehicle_models_provider.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class VehicleTypeStepWidget extends ConsumerStatefulWidget {
  const VehicleTypeStepWidget({
    required this.onTap,
    super.key,
    this.manageVehicle = false,
  });

  final VoidCallback onTap;
  final bool manageVehicle;

  @override
  ConsumerState<VehicleTypeStepWidget> createState() =>
      _VehicleTypeStepWidgetState();
}

class _VehicleTypeStepWidgetState extends ConsumerState<VehicleTypeStepWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ref.watch(registerFormProvider);
    final registerForm = ref.watch(registerFormProvider);
    final step = ref.watch(registerStepProvider);

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 29.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                if (widget.manageVehicle == false)
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
                    text: context.appLocale.selectVehicleType,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            widget.manageVehicle == false ? 40.hb : 17.hb,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Consumer(builder: (context, ref, _) {
                final vehicleModelsAsync = ref.watch(vehicleModelsProvider);

                if (!vehicleModelsAsync.hasValue) {
                  return CircularProgressIndicator(
                      color: R.colors.navyBlue_263C51);
                }

                final vehicleModels = vehicleModelsAsync.value;

                return Row(
                  children: List.generate(
                    vehicleModels!.length,
                    (index) {
                      final type = vehicleModels[index];
                      final isSelected = type.id == registerForm.vehicleId;

                      return Padding(
                        padding: EdgeInsets.only(right: 15.w),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(6.r),
                          onTap: () {
                            ref
                                .read(registerFormProvider.notifier)
                                .setVehicleId(type.id);
                          },
                          child: Container(
                            width: 132.r,
                            height: 132.r,
                            padding: EdgeInsets.all(6.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              border: Border.all(
                                color: isSelected
                                    ? R.colors.navyBlue_263C51
                                    : R.colors.grey_CBE2EF,
                              ),
                            ),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                    isSelected
                                        ? Icons.check_circle
                                        : Icons.circle_outlined,
                                    color: isSelected
                                        ? R.colors.navyBlue_263C51
                                        : R.colors.grey_CBE2EF,
                                  ),
                                ),
                                9.hb,
                                SizedBox(
                                  width: 84.w,
                                  height: 50.h,
                                  child: SvgPicture.string(
                                    type.img,
                                    colorFilter: ColorFilter.mode(
                                      isSelected
                                          ? R.colors.navyBlue_263C51
                                          : R.colors.grey_CBE2EF,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                                5.62.hb,
                                AppText(
                                  text: type.name,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: isSelected
                                      ? R.colors.navyBlue_263C51
                                      : R.colors.grey_CBE2EF,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
            40.hb,

            /// [Vehicle License Number]
            TextInputField(
              onChanged: (v) {
                if (!widget.manageVehicle) {
                  ref
                      .read(registerFormProvider.notifier)
                      .setVehicleLicenseNumber(v!);
                } else {}
              },
              hintText: context.appLocale.licenseNumberHere,
              labelText: context.appLocale.vehicleLicenseNumber,
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return 'Please enter your vehicle license number';
                }
                return null;
              },
            ),

            18.hb,

            /// [Driving License Number]
            TextInputField(
              onChanged: (v) {
                if (!widget.manageVehicle) {
                  ref
                      .read(registerFormProvider.notifier)
                      .setDrivingLicenseNumber(v!);
                } else {}
              },
              hintText: context.appLocale.drivingNumberHere,
              labelText: context.appLocale.drivingLicenseNumber,
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return 'Please enter your driving license number';
                }
                return null;
              },
            ),

            widget.manageVehicle == false ? 80.hb : 48.hb,

            Center(
                child: AppFilledButton(
              text: (widget.manageVehicle)
                  ? context.appLocale.requestUpdate
                  : context.appLocale.next,
              width: 330,
              onTap: () {
                if ((_formKey.currentState?.validate() ?? false) &&
                    registerForm.vehicleId != null) {
                  widget.onTap();
                } else {
                  showToast(msg: 'Please select vehicle type');
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
