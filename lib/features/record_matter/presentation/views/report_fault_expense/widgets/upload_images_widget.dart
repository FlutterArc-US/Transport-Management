import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/image_picker/presentation/views/popups/open_gallery_camera_dialog.dart';
import 'package:transport_management/features/image_picker/utils/pick_image_util.dart';
import 'package:transport_management/features/record_matter/presentation/providers/uploaded_attachments_provider/uploaded_attachments_provider.dart';
import 'package:transport_management/util/resources/r.dart';

class UploadDocsImagesWidget extends ConsumerWidget {
  const UploadDocsImagesWidget({
    required this.onChanged,
    required this.text,
    super.key,
  });

  final void Function(List<String>) onChanged;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attachments = ref.watch(uploadedAttachmentsProvider);

    return Container(
      padding: EdgeInsets.only(
        top: 33.h,
        bottom: 8.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: R.colors.white_FFFFFF,
        boxShadow: [
          BoxShadow(
            color: R.colors.grey_AEAEAE.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: attachments.isNotEmpty
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                attachments.length + 1,
                (index) {
                  return index == 0
                      ? InkWell(
                          onTap: () {
                            showModalBottomSheet<void>(
                              context: context,
                              showDragHandle: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.r),
                                  topRight: Radius.circular(30.r),
                                ),
                              ),
                              builder: (context) {
                                return OpenGalleryCameraSheet(onTapCamera: () {
                                  PickImageUtil().pickCameraImage(
                                    context: context,
                                    ref: ref,
                                    callback: (v) {
                                      ref
                                          .read(uploadedAttachmentsProvider
                                              .notifier)
                                          .add(v);
                                      onChanged(attachments);
                                    },
                                  );
                                }, onTapGallery: () {
                                  PickImageUtil().pickMultipleGalleryImages(
                                    context: context,
                                    ref: ref,
                                    callback: (v) {
                                      ref
                                          .read(uploadedAttachmentsProvider
                                              .notifier)
                                          .addMultiple(v);
                                      onChanged(attachments);
                                    },
                                  );
                                });
                              },
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                            child: DottedBorder(
                              borderType: BorderType.Circle,
                              dashPattern: const [8, 10, 10, 10],
                              strokeWidth: 4.w,
                              color: R.colors.green_85C933,
                              child: Padding(
                                padding: EdgeInsets.all(3.r),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.add_rounded,
                                    weight: 2,
                                    size: 36.r,
                                    color: R.colors.green_85C933,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(right: 14.w),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              SizedBox(
                                height: 53.r,
                                width: 53.r,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(55.r),
                                  child: Image.file(
                                    File(attachments[index - 1]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  ref
                                      .read(
                                          uploadedAttachmentsProvider.notifier)
                                      .remove(attachments[index - 1]);
                                },
                                child: Container(
                                  height: 18.r,
                                  width: 18.r,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: R.colors.red_DE2323,
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    color: R.colors.white_FFFFFF,
                                    size: 18.r,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                },
              ),
            ),
          ),
          24.hb,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.file_upload_outlined,
                size: 24.r,
                color: R.colors.grey_4D4D4D,
              ),
              6.wb,
              AppText(
                text: text,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: R.colors.grey_4D4D4D,
              ),
            ],
          )
        ],
      ),
    );
  }
}
