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
      height: size?.r ?? 72.r,
      width: size?.r ?? 72.r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(66.r),
        border: Border.all(color: R.colors.green_337A34),
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
                color: R.colors.green_337A34,
                size: size != null ? size! * 0.6 : 36.r,
              ),
      ),
    );
  }
}
