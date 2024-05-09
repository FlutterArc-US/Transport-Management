import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/features/onboarding/presentation/views/widgets/intro_headline_and_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewContent extends ConsumerWidget {
  const PageViewContent({
    required this.image,
    required this.title,
    required this.description,
    super.key,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(
          height: 200.r,
          width: 300.w,
          child: Image.asset(image),
        ),
        32.hb,
        IntroHeadlineAndDescriptionWidget(
          title: title,
          description: description,
        ),
      ],
    );
  }
}
