import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:transport_management/features/onboarding/domain/models/onboard_page_model.dart';
import 'package:transport_management/gen/assets.gen.dart';

part 'onboard_page_data_provider.g.dart';

@riverpod
class OnboardPageData extends _$OnboardPageData {
  @override
  List<OnboardPageModel> build() {
    final introDataList = [
      OnboardPageModel(
        title: 'View Assigned Loads',
        description: 'Use powerful map to reach your pickup point and deliver assigned load.',
        image: Assets.pngs.ob1image.path,
      ),
      OnboardPageModel(
        title: 'See Upcoming Bookings',
        description:
            "Keep track of upcoming routine and loads assigned to you.",
        image: Assets.pngs.ob2image.path,
      ),
      OnboardPageModel(
        title: 'Record Expenses',
        description:
            'Record Faults, Expenses and Odometer readings so your transport company knows all.',
        image: Assets.pngs.ob3image.path,
      ),
    ];

    return introDataList;
  }
}
