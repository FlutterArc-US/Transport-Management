import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:transport_management/common/extensions/large_file_checker.dart';
import 'package:transport_management/util/exceptions/message_exception.dart';

abstract class ImagePickerHelper {
  Future<String> cameraImage();

  Future<String> galleryImage();

  Future<List<String>> multiGalleryImages();
}

@LazySingleton(as: ImagePickerHelper)
class ImagePickerImagePickerHelper implements ImagePickerHelper {
  final ImagePicker imagePicker = ImagePicker();

  @override
  Future<List<String>> multiGalleryImages() async {
    final imagesList = await imagePicker.pickMultiImage();
    if (imagesList.isEmpty) {
      throw ImageNotSelectedException();
    }
    final selectedPaths = <String>[];

    for (final image in imagesList) {
      final file = File(image.path);
      final bytes = await file.readAsBytes();

      /// [When image size is less than or equal to 5MB]
      if (bytes.lengthInBytes.isMoreThan5MBs()) {
        throw ImageSizeExceedsSizeLimitException();
      }
      selectedPaths.add(image.path);
    }
    return selectedPaths;
  }

  @override
  Future<String> cameraImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if (image == null) {
      throw ImageNotSelectedException();
    }
    return image.path;
  }

  @override
  Future<String> galleryImage() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      throw ImageNotSelectedException();
    } else {
      // Check if the selected file is an image
      if (image.path.endsWith('.jpg') ||
          image.path.endsWith('.jpeg') ||
          image.path.endsWith('.png')) {
        final file = File(image.path);
        final bytes = await file.readAsBytes();

        /// [When image size is less than or equal to 5MB]
        if (bytes.lengthInBytes.isMoreThan5MBs()) {
          throw ImageSizeExceedsSizeLimitException();
        }
        return image.path;
      } else {
        throw ImageFileNotSupportedException();
      }
    }
  }
}
