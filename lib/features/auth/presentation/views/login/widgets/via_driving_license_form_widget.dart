import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/auth/presentation/providers/login/login_form_provider.dart';
import 'package:transport_management/features/image_picker/utils/pick_image_util.dart';

class ViaDrivingLicenseFormWidget extends ConsumerWidget {
  const ViaDrivingLicenseFormWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginForm = ref.watch(loginFormProvider);

    return InkWell(
      onTap: () {
        PickImageUtil().pickCameraImage(
          context: context,
          ref: ref,
          callback: (v) {
            ref.read(loginFormProvider.notifier).setLicenseImage(v);
          },
        );
      },
      child: SizedBox(
        width: double.infinity,
        height: 200.h,
        child: loginForm.licenseImage != null
            ? Image.file(
                File(loginForm.licenseImage!),
                fit: BoxFit.cover,
              )
            : DottedBorder(
                child: const Center(
                  child: AppText(
                    text: 'Upload Image or Scan NFC',
                    fontSize: 14,
                  ),
                ),
              ),
      ),
    );
  }
}
