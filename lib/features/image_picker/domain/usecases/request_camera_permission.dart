import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:transport_management/infrastructure/usecase.dart';
import 'package:transport_management/infrastructure/usecase_input.dart';
import 'package:transport_management/infrastructure/usecase_output.dart';
import 'package:transport_management/util/exceptions/message_exception.dart';

class RequestCameraPermissionUsecaseInput extends Input {
  RequestCameraPermissionUsecaseInput();
}

class RequestCameraPermissionUsecaseOutput extends Output {
  RequestCameraPermissionUsecaseOutput();
}

@lazySingleton
class RequestCameraPermissionUsecase extends Usecase<
    RequestCameraPermissionUsecaseInput, RequestCameraPermissionUsecaseOutput> {
  bool _permissionEnabled = false;

  @override
  Future<RequestCameraPermissionUsecaseOutput> call(Input input) async {
    _permissionEnabled = await Permission.camera.isGranted;

    if (!_permissionEnabled) {
      final permissionStatus = await Permission.camera.request();

      if (permissionStatus.isPermanentlyDenied) {
        throw CameraPermissionDeniedPermanently(
          message: 'Camera permission is permanently denied',
        );
      } else if (permissionStatus.isDenied) {
        throw MessageException(
          message: 'Camera permission is denied',
        );
      }
    }

    return RequestCameraPermissionUsecaseOutput();
  }
}
