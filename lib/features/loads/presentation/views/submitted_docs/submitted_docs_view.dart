import 'dart:io';

import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/features/loads/presentation/providers/submitted_docs_provider/selected_submitted_docs_provider.dart';
import 'package:transport_management/features/loads/presentation/providers/submitted_docs_provider/submitted_docs_provider.dart';
import 'package:transport_management/features/loads/presentation/views/pretrip/popups/upload_image_popup.dart';
import 'package:transport_management/features/loads/presentation/views/submitted_docs/popups/docs_submitted_popup.dart';
import 'package:transport_management/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SubmittedDocsView extends ConsumerStatefulWidget {
  const SubmittedDocsView({
    super.key,
  });

  @override
  ConsumerState<SubmittedDocsView> createState() => _SubmittedImagesListState();
}

class _SubmittedImagesListState extends ConsumerState<SubmittedDocsView> {
  bool isTappedLong = false;

  @override
  Widget build(BuildContext context) {
    final submittedDocs = ref.watch(submittedDocsProvider);
    final selectedDocs = ref.watch(selectedSubmittedDocsProvider);

    return Scaffold(
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Column(
          children: [
            MediaQuery.of(context).padding.top.hb,
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackButtonWidget(),
                  InkWell(
                    borderRadius: BorderRadius.circular(18.r),
                    onTap: () {
                      ref
                          .read(submittedDocsProvider.notifier)
                          .removeMultiple(selectedDocs);
                    },
                    child: Icon(
                      Icons.delete_outline,
                      size: 24.r,
                      color: R.colors.black_FF000000,
                    ),
                  )
                ],
              ),
            ),
            24.hb,
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: AppText(
                  text: context.appLocale.pod,
                  color: R.colors.blue_20B4E3,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                itemCount: submittedDocs.length + 1,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 1.h,
                ),
                itemBuilder: (context, index) {
                  if (index < submittedDocs.length) {
                    bool isSelected =
                        selectedDocs.contains(submittedDocs[index]);

                    return InkWell(
                      borderRadius: BorderRadius.circular(8.47.r),
                      onTap: () {
                        if (isTappedLong) {
                          ref
                              .read(selectedSubmittedDocsProvider.notifier)
                              .update(submittedDocs[index]);
                        } else {}
                      },
                      onLongPress: () {
                        setState(() {
                          isTappedLong = true;
                        });

                        ref
                            .read(selectedSubmittedDocsProvider.notifier)
                            .update(submittedDocs[index]);
                      },
                      child: Center(
                        child: SizedBox(
                          height: 105.r,
                          width: 105.r,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.47.r),
                                child: Image.file(
                                  File(submittedDocs[index]),
                                  height: 105.r,
                                  width: 105.r,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              if (isSelected)
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Padding(
                                    padding: EdgeInsets.all(4.r),
                                    child: Container(
                                      width: 24.r,
                                      height: 24.r,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        color: R.colors.blue_20B4E3,
                                      ),
                                      child: Icon(
                                        Icons.check,
                                        color: R.colors.white_FFFFFF,
                                        size: 18.r,
                                      ),
                                    ),
                                  ),
                                )
                              else if (isTappedLong)
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Padding(
                                    padding: EdgeInsets.all(4.r),
                                    child: Container(
                                      width: 24.r,
                                      height: 24.r,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                        color: R.colors.white_FFFFFF,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return InkWell(
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
                            return UploadImagePopup(
                              onCameraClick: (v) {
                                ref.read(submittedDocsProvider.notifier).add(v);
                              },
                              onMultipleGalleryClick: (v) {
                                ref
                                    .read(submittedDocsProvider.notifier)
                                    .addMultiple(v);

                                if (!context.mounted) return;

                                GoRouter.of(context).pop();
                              },
                            );
                          },
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.47.r),
                        child: Padding(
                          padding: EdgeInsets.all(6.r),
                          child: Container(
                            width: 105.r,
                            height: 105.r,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.47.r),
                              color: R.colors.navyBlue_263C51,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_rounded,
                                  size: 32.r,
                                  color: R.colors.white_FFFFFF,
                                ),
                                18.hb,
                                AppText(
                                  text: context.appLocale.addImages,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: R.colors.white_FFFFFF,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            AppFilledButton(
              text: context.appLocale.submitPOD,
              onTap: () {
                GoRouter.of(context).pop();

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
                    return const DocsSubmittedPopup();
                  },
                );
              },
            ),
            24.hb,
          ],
        ),
      ),
    );
  }
}
