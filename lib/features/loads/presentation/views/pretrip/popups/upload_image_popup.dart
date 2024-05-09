import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/features/auth/presentation/providers/update_profile_provider/update_profile_form_provider.dart';
import 'package:transport_management/util/loading/loading.dart';
import 'package:transport_management/util/pick_image/pick_image.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:transport_management/util/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadImagePopup extends ConsumerWidget {
  const UploadImagePopup({
    required this.onCameraClick,
    super.key,
    this.onSingleGalleryClick,
    this.onMultipleGalleryClick,
  });

  final void Function(String)? onCameraClick;
  final void Function(String)? onSingleGalleryClick;
  final void Function(List<String>)? onMultipleGalleryClick;

  Future<void> onTapCamera(BuildContext context, WidgetRef ref) async {
    try {
      await PickImageUtil().pickCameraImage(
        context: context,
        ref: ref,
        callback: (v) {
          if (onCameraClick != null) {
            onCameraClick!(v);
          }
        },
      );
    } catch (e) {
      showToast(msg: 'Something went wrong');
    } finally {
      dismissLoading();
    }
  }

  Future<void> onTapGallery(BuildContext context, WidgetRef ref) async {
    try {
      if (onSingleGalleryClick != null) {
        await PickImageUtil().pickGalleryImage(
          context: context,
          ref: ref,
          callback: (v) {
            onSingleGalleryClick!(v);
          },
        );
      } else if (onMultipleGalleryClick != null) {
        await PickImageUtil().pickMultipleGalleryImages(
          context: context,
          ref: ref,
          callback: (v) {
            onMultipleGalleryClick!(v);
          },
        );
      }
    } catch (e) {
      showToast(msg: 'Something went wrong');
    } finally {
      dismissLoading();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(updateProfileFormProvider);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 24.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.appLocale.chooseOption,
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
                borderRadius: BorderRadius.circular(10.r),
                onTap: () => onTapGallery(context, ref),
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
                          context.appLocale.gallery,
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
                onTap: () => onTapCamera(context, ref),
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
                          context.appLocale.camera,
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
    );
  }
}
