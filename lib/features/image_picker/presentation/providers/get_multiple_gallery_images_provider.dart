import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/image_picker/domain/usecases/pick_multi_images_usecase.dart';
import 'package:transport_management/infrastructure/usecase_input.dart';
import 'package:transport_management/util/di/di.dart';

part 'get_multiple_gallery_images_provider.g.dart';

@riverpod
Future<List<String>> getMultipleGalleryImages(Ref ref) async {
  final pickMultipleImages = sl<PickMultiGalleryImagesUsecase>();
  final output = await pickMultipleImages(NoInput());
  return output;
}
