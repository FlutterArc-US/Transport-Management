import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/features/loads/domain/enums/shipment_type/shipment_type.dart';
import 'package:transport_management/features/loads/presentation/providers/shipment_type_provider/shipment_type_provider.dart';
import 'package:transport_management/util/resources/r.dart';

class ShipmentTypeSelectionWidget extends ConsumerWidget {
  const ShipmentTypeSelectionWidget({super.key});

  String shipmentTypeName(ShipmentTypeModel type, BuildContext context) {
    if (type == ShipmentTypeModel.pickup) {
      return context.appLocale.pickup;
    } else {
      return context.appLocale.delivery;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedShipmentType = ref.watch(shipmentTypeProvider);

    return Center(
      child: Container(
        height: 45.h,
        width: 350.w,
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          color: R.colors.grey_767680.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            ShipmentTypeModel.values.length,
            (index) {
              final currentType = ShipmentTypeModel.values[index];
              return InkWell(
                borderRadius: BorderRadius.circular(8.r),
                onTap: () {
                  ref
                      .read(shipmentTypeProvider.notifier)
                      .update((state) => currentType);
                },
                child: Container(
                  height: 38.h,
                  width: 170.w,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: currentType == selectedShipmentType
                        ? R.colors.white_FFFFFF
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        currentType.icon,
                        colorFilter: ColorFilter.mode(
                          currentType == selectedShipmentType
                              ? R.colors.navyBlue_263C51
                              : R.colors.grey_767680,
                          BlendMode.srcIn,
                        ),
                      ),
                      8.wb,
                      SizedBox(
                        height: 38.h,
                        width: 70.w,
                        child: Center(
                          child: AutoSizeText(
                            shipmentTypeName(currentType, context),
                            style: TextStyle(
                              color: currentType == selectedShipmentType
                                  ? R.colors.navyBlue_263C51
                                  : R.colors.grey_767680,
                              fontWeight: FontWeight.w600,
                              fontSize: 15.47,
                            ),
                          ),
                        ),
                      ),
                    ],
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
