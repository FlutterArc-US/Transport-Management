import 'package:transport_management/helpers/image_picker/image_picker.dart';
import 'package:transport_management/infrastructure/usecase.dart';
import 'package:transport_management/infrastructure/usecase_input.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PickGalleryImageUsecase implements Usecase<NoInput, String> {
  PickGalleryImageUsecase({required ImagePickerHelper image}) : _image = image;
  final ImagePickerHelper _image;

  @override
  Future<String> call(NoInput imagePath) async {
    return _image.galleryImage();
  }
}
