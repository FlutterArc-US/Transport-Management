import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transport_management/features/onboarding/presentation/providers/onboard_page_data_provider.dart';
import 'package:transport_management/features/onboarding/presentation/providers/onboard_page_provider.dart';
import 'package:transport_management/features/onboarding/presentation/views/widgets/page_view_content.dart';

class IntroViewPage extends ConsumerStatefulWidget {
  const IntroViewPage({super.key});

  @override
  ConsumerState<IntroViewPage> createState() => _IntroViewPageState();
}

class _IntroViewPageState extends ConsumerState<IntroViewPage> {
  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final count = ref.watch(onboardPageNumberProvider);
    final introDataList = ref.watch(onboardPageDataProvider);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final currentPage = pageController.page!.round();
      final nextPage = currentPage + 1;

      if (nextPage < count) {
        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
        );
      }
    });

    /// [Page view for slides]
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (value) async {
          ref.read(onboardPageNumberProvider.notifier).state = value + 1;
        },
        itemCount: introDataList.length,
        itemBuilder: (BuildContext context, int index) {
          final introData = introDataList[index];

          return PageViewContent(
            image: introData.image,
            title: introData.title,
            description: introData.description,
          );
        },
      ),
    );
  }
}
