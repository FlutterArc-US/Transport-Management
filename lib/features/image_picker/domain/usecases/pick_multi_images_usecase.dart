import 'package:avcons/helpers/image_picker/image_picker.dart';
import 'package:avcons/infrastructure/usecase.dart';
import 'package:avcons/infrastructure/usecase_input.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PickMultiGalleryImagesUsecase implements Usecase<NoInput, List<String>> {
  PickMultiGalleryImagesUsecase({required ImagePickerHelper image})
      : _image = image;
  final ImagePickerHelper _image;

  @override
  Future<List<String>> call(NoInput input) async {
    return _image.multiGalleryImages();
  }
}
