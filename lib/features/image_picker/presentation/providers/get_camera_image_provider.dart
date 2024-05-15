import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/image_picker/domain/usecases/pick_camera_image_usecase.dart';
import 'package:transport_management/infrastructure/usecase_input.dart';
import 'package:transport_management/util/di/di.dart';

part 'get_camera_image_provider.g.dart';

@riverpod
Future<String> getCameraImage(GetCameraImageRef ref) async {
  final pickCameraImageUsecase = sl<PickCameraImageUsecase>();
  final output = await pickCameraImageUsecase(NoInput());
  return output;
}
