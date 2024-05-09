import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/features/auth/domain/models/vehicle_model/vehicle_model_model.dart';
import 'package:avcons/util/resources/r.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VehicleTypeWidget extends StatelessWidget {
  const VehicleTypeWidget({
    required this.vehicle,
    super.key,
  });

  final VehicleModelModel vehicle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 20.r,
          width: 20.r,
          child: CachedNetworkImage(
            imageUrl: vehicle.img,
            color: R.colors.white_FFFFFF,
          ),
        ),
        4.wb,
        AppText(
          text: vehicle.name,
          color: R.colors.white_FFFFFF,
          fontSize: 12,
        ),
      ],
    );
  }
}
