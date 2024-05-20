import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';

class CourseCardWidget extends StatelessWidget {
  const CourseCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.44.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          /// [Image]
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 120.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.44.r),
                    topRight: Radius.circular(8.44.r),
                  ),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:
                        'https://fastly.picsum.photos/id/82/536/354.jpg?hmac=Or61FKCzkHXAug9sbtmEtGnjKEvAkOwWGXmLA5O9458',
                  ),
                ),
              ),
              CircleAvatar(
                radius: 22.r,
                backgroundColor: R.colors.green_074834.withOpacity(0.7),
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: R.colors.green_CFF07B,
                  size: 24.r,
                ),
              ),
            ],
          ),

          14.hb,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 238.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: 'Tutorial 1 : Basics',
                        fontSize: 17.8,
                        fontWeight: FontWeight.w500,
                        color: R.colors.green_337A34,
                      ),
                      4.hb,
                      AppText(
                        text:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis.',
                        fontSize: 12,
                        color: R.colors.black_FF000000,
                        height: 1.3.h,
                      ),
                      24.hb,
                    ],
                  ),
                ),
                SizedBox(
                  height: 22.r,
                  width: 22.r,
                  child: Assets.svgs.favIcon.svg(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
