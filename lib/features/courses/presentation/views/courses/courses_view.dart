import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/features/courses/presentation/views/courses/widgets/courses_filter_widget.dart';
import 'package:transport_management/features/courses/presentation/views/courses/widgets/courses_list.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        body: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Column(
            children: [
              MediaQuery.of(context).padding.top.hb,
              const BackButtonWidget(),
              20.49.hb,
              AppText(
                text: context.appLocale.courses,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
              33.hb,
              const CoursesFilterWidget(),
              38.hb,
              const CoursesList(),
            ],
          ),
        ),
      ),
    );
  }
}
