import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/common/widgets/custom_text_form_field.dart';
import 'package:transport_management/features/auth/presentation/views/change_request/popups/change_request_popup.dart';
import 'package:transport_management/features/auth/presentation/views/change_request/widgets/contact_widget.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';

class ChangeRequestView extends StatelessWidget {
  const ChangeRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaPadding = MediaQuery.of(context).padding;

    return Scaffold(
      body: KeyboardDismissOnTap(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [
              mediaPadding.top.hb,
              29.hb,
              BackButtonWidget(
                color: R.colors.black_FF000000,
              ),
              47.77.hb,

              /// [Heading]
              AppText(
                text: context.appLocale.requestChange,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: R.colors.black_1E1E1E,
              ),

              22.hb,

              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      22.hb,

                      /// [Contact by phone number]
                      ContactWigdet(
                        icon: Assets.svgs.phone.svg(),
                        title: context.appLocale.callOurSupport,
                        contact: '+9292929292929',
                      ),
                      25.hb,

                      /// [Contact by email]
                      ContactWigdet(
                        icon: Assets.svgs.email.svg(),
                        title: context.appLocale.emailOurSupport,
                        contact: 'info@avcons.com',
                      ),
                      29.hb,

                      CustomTextFormField(
                        width: 350,
                        maxLines: 8,
                        minLine: 8,
                        keyboardType: TextInputType.text,
                        onChanged: (v) {},
                        hintText: context.appLocale.typeHere,
                        validator: (String? v) {
                          if (v == null || v.isEmpty) {
                            return context.appLocale.enterYourRequest;
                          }
                          return null;
                        },
                      ),
                      21.hb,
                      AppFilledButton(
                          text: context.appLocale.sendRequest,
                          onTap: () {
                            showModalBottomSheet<void>(
                              context: context,
                              showDragHandle: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.r),
                                  topRight: Radius.circular(30.r),
                                ),
                              ),
                              builder: (context) {
                                return const ChangeRequestPopup();
                              },
                            );
                          }),
                    ],
                  ),
                ),
              ),
              mediaPadding.bottom.hb,
            ],
          ),
        ),
      ),
    );
  }
}
