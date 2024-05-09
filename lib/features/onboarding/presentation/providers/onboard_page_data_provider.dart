import 'package:transport_management/features/onboarding/domain/models/onboard_page_model.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboard_page_data_provider.g.dart';

@riverpod
class OnboardPageData extends _$OnboardPageData {
  @override
  List<OnboardPageModel> build() {
    final introDataList = [
      OnboardPageModel(
        title: 'Register your Truck Or Be Part Of Fleet',
        description: 'You can own your vehicle and become a solo driver',
        image: Assets.pngs.ob1image.path,
      ),
      OnboardPageModel(
        title: 'Book Your Load',
        description:
            "Learn, grow, and succeed with our app's diverse educational resources, interactive lessons, and personalized learning experiences.",
        image: Assets.pngs.ob2image.path,
      ),
      OnboardPageModel(
        title: 'Use AI To Boost Match',
        description:
            'Unlock your potential with interactive courses and expert instructors at your fingertips.',
        image: Assets.pngs.ob3image.path,
      ),
      OnboardPageModel(
        title: 'Earn & See Reports',
        description:
            'Learn anytime, anywhere, with a vast library of educational content and personalized study plans.',
        image: Assets.pngs.ob4image.path,
      ),
    ];

    return introDataList;
  }
}
