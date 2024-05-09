import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/util/resources/r.dart';

class UserProfileAvatar extends ConsumerWidget {
  const UserProfileAvatar({
    super.key,
    this.size,
    this.image,
  });

  final double? size;
  final String? image;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 72.r,
      width: 72.r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(66.r),
        border: Border.all(color: R.colors.blue_20B4E3),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(66.r),
        child: image != null
            ? CachedNetworkImage(
                imageUrl: image!,
                fit: BoxFit.cover,
              )
            : Icon(
                Icons.person,
                color: R.colors.navyBlue_263C51,
                size: 36.r,
              ),
      ),
    );
  }
}