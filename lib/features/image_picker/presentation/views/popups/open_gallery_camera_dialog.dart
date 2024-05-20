import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/util/resources/r.dart';

class OpenGalleryCameraDialog extends StatelessWidget {
  const OpenGalleryCameraDialog({
    required this.onTapCamera,
    required this.onTapGallery,
    super.key,
  });

  final VoidCallback onTapCamera;
  final VoidCallback onTapGallery;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 24.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Choose an option',
              style: TextStyle(
                color: R.colors.black_FF000000,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            24.hb,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: onTapGallery,
                  borderRadius: BorderRadius.circular(10.r),
                  child: SizedBox(
                    width: 132.w,
                    height: 130.h,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.photo_library,
                            color: R.colors.grey_ABBED1,
                            size: 40.r,
                          ),
                          Text(
                            'Phone Gallery',
                            style: TextStyle(
                              color: R.colors.black_FF000000,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: onTapCamera,
                  borderRadius: BorderRadius.circular(10.r),
                  child: SizedBox(
                    width: 132.w,
                    height: 130.h,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.photo_camera_rounded,
                            color: R.colors.grey_ABBED1,
                            size: 40.r,
                          ),
                          Text(
                            'Open Camera',
                            style: TextStyle(
                              color: R.colors.black_FF000000,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
