import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/features/image_picker/presentation/providers/get_camera_image_provider.dart';
import 'package:transport_management/features/image_picker/presentation/providers/get_gallery_image_provider.dart';
import 'package:transport_management/features/image_picker/presentation/providers/get_multiple_gallery_images_provider.dart';
import 'package:transport_management/features/image_picker/presentation/providers/request_camera_permission_provider.dart';
import 'package:transport_management/features/image_picker/presentation/providers/request_storage_permission_provider.dart';
import 'package:transport_management/features/image_picker/presentation/views/popups/allow_permission_popup.dart';
import 'package:transport_management/util/exceptions/message_exception.dart';
import 'package:transport_management/util/toast/toast.dart';

class PickImageUtil {
  /// [on Tap Gallery]
  Future<void> pickGalleryImage({
    required BuildContext context,
    required WidgetRef ref,
    required void Function(String v) callback,
  }) async {
    try {
      await ref.read(requestStoragePermissionProvider.future);
      final image = await ref.read(getGalleryImageProvider.future);
      callback(image);

      if (context.mounted) {
        GoRouter.of(context).pop();
      }
      return;
    } on MessageException catch (e) {
      debugPrint(e.message);
      return;
    } on StoragePermissionDenied {
      showToast(msg: 'Storage Permission is denied');
      return;
    } on StoragePermissionDeniedPermanently {
      if (context.mounted) {
        await showDialog<void>(
          context: context,
          builder: (context) => const RequestPermissionWidget(
            icon: Icons.camera,
            description:
                'Allow app to access you gallery while you use the app',
          ),
        );
      }
      return;
    } on ImageFileNotSupportedException {
      showToast(msg: 'File not supported');
      return;
    } on ImageSizeExceedsSizeLimitException {
      showToast(msg: 'Image size exceeds 5Mb');
      return;
    } on ImageNotSelectedException {
      return;
    } catch (e) {
      debugPrint('Something went wrong');
    }
    return;
  }

  Future<void> pickMultipleGalleryImages({
    required BuildContext context,
    required WidgetRef ref,
    required void Function(List<String> v) callback,
  }) async {
    try {
      await ref.read(requestStoragePermissionProvider.future);
      final images = await ref.read(getMultipleGalleryImagesProvider.future);
      callback(images);

      if (context.mounted) {
        GoRouter.of(context).pop();
      }
      return;
    } on MessageException catch (e) {
      debugPrint(e.message);
      return;
    } on StoragePermissionDenied {
      showToast(msg: 'Storage Permission is denied');
      return;
    } on StoragePermissionDeniedPermanently {
      if (context.mounted) {
        await showDialog<void>(
          context: context,
          builder: (context) => const RequestPermissionWidget(
            icon: Icons.camera,
            description:
                'Allow app to access you gallery while you use the app',
          ),
        );
      }
      return;
    } on ImageFileNotSupportedException {
      showToast(msg: 'File not supported');
      return;
    } on ImageSizeExceedsSizeLimitException {
      showToast(msg: 'Image size exceeds 5Mb');
      return;
    } on ImageNotSelectedException {
      return;
    } catch (e) {
      debugPrint('Something went wrong');
    }
    return;
  }

  /// [on Tap Camera]
  Future<void> pickCameraImage({
    required BuildContext context,
    required WidgetRef ref,
    required void Function(String v) callback,
  }) async {
    try {
      await ref.read(requestCameraPermissionProvider.future);
      final image = await ref.read(getCameraImageProvider.future);
      callback(image);

      if (context.mounted) {
        GoRouter.of(context).pop();
      }
      return;
    } on MessageException catch (e) {
      debugPrint(e.message);
      return;
    } on CameraPermissionDenied catch (e) {
      showToast(msg: e.message);
      return;
    } on CameraPermissionDeniedPermanently {
      if (context.mounted) {
        await showDialog<void>(
          context: context,
          builder: (context) => const RequestPermissionWidget(
            icon: Icons.camera_alt,
            description:
                'Allow app to access you gallery while you use the app',
          ),
        );
      }
      return;
    } on ImageNotSelectedException {
      return;
    } catch (e) {
      debugPrint('Something went wrong');
    }
  }
}
