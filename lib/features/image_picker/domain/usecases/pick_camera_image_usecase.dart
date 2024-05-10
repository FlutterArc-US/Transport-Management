import 'package:injectable/injectable.dart';
import 'package:transport_management/features/image_picker/domain/data/image_picker_data_source.dart';
import 'package:transport_management/infrastructure/usecase.dart';
import 'package:transport_management/infrastructure/usecase_input.dart';

@lazySingleton
class PickCameraImageUsecase implements Usecase<NoInput, String> {
  PickCameraImageUsecase({required ImagePickerHelper image}) : _image = image;
  final ImagePickerHelper _image;

  @override
  Future<String> call(NoInput imagePath) async {
    return _image.cameraImage();
  }
}
