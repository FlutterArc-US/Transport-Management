import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/image_picker/domain/usecases/request_storage_permission.dart';
import 'package:transport_management/infrastructure/usecase_input.dart';
import 'package:transport_management/util/di/di.dart';

part 'request_storage_permission_provider.g.dart';

@riverpod
Future<void> requestStoragePermission(Ref ref) async {
  final requestStoragePermissionUsecase = sl<RequestStoragePermissionUsecase>();
  await requestStoragePermissionUsecase(NoInput());
}
