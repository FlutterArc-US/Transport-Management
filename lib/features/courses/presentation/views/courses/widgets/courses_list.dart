import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/features/courses/presentation/views/courses/widgets/course_card_widget.dart';

class CoursesList extends StatelessWidget {
  const CoursesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 27.w,
          vertical: 12.h,
        ),
        separatorBuilder: (context, index) {
          return Column(
            children: [
              14.hb,
              const Divider(),
              14.hb,
            ],
          );
        },
        itemBuilder: (context, index) {
          return const CourseCardWidget();
        },
      ),
    );
  }
}
