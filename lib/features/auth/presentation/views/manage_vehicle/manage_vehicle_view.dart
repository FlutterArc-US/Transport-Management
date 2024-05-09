import 'package:avcons/common/extensions/app_localization.dart';
import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/common/widgets/back_button_widget.dart';
import 'package:avcons/features/auth/presentation/views/register/widgets/vehicle_type_step.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:avcons/util/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ManageVehicleView extends StatelessWidget {
  const ManageVehicleView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaPadding = MediaQuery.of(context).padding;

    return Scaffold(
      body: KeyboardDismissOnTap(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [
              mediaPadding.top.hb,
              29.hb,
              BackButtonWidget(
                color: R.colors.black_FF000000,
              ),
              47.77.hb,

              /// [Heading]
              AppText(
                text: context.appLocale.manageVehicle,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: R.colors.black_1E1E1E,
              ),
              35.hb,
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: VehicleTypeStepWidget(
                    onTap: () {
                      GoRouter.of(context).push(RoutePaths.changeRequest);
                    },
                    manageVehicle: true,
                  ),
                ),
              ),
              mediaPadding.bottom.hb,
            ],
          ),
        ),
      ),
    );
  }
}
