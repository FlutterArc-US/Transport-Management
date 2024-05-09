import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/features/auth/presentation/providers/vehicle_models_provider/vehicle_models_provider.dart';
import 'package:avcons/features/loads/presentation/providers/vehicle_type_provider/vehicle_type_provider.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class VehicleTypeSelectionWidget extends ConsumerWidget {
  const VehicleTypeSelectionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedVehiclesType = ref.watch(vehicleTypeProvider);
    final vehiclesAsync = ref.watch(vehicleModelsProvider);

    if (!vehiclesAsync.hasValue) {
      return CircularProgressIndicator(color: R.colors.navyBlue_263C51);
    }

    final vehicles = vehiclesAsync.value!;

    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: List.generate(
            vehicles.length,
            (index) {
              final type = vehicles[index];
              final isSelected = selectedVehiclesType?.contains(type) ?? false;

              return Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: InkWell(
                  borderRadius: BorderRadius.circular(4.r),
                  onTap: () {
                    ref.read(vehicleTypeProvider.notifier).update(type);
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
                          height: 50.r,
                          width: 50.r,
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
        ),
      ),
    );
  }
}
