import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_bottom_sheet_popup.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/common/widgets/text_input_field.dart';
import 'package:transport_management/features/home/domain/enums/leave_type.dart';
import 'package:transport_management/features/record_matter/domain/models/leave/leave_model.dart';
import 'package:transport_management/features/record_matter/presentation/providers/leave_type_provider/leave_type_provider.dart';
import 'package:transport_management/features/record_matter/presentation/providers/selected_leaves_provider/selected_leaves_provider.dart';
import 'package:transport_management/features/record_matter/presentation/views/leaves/widgets/calendar_widget.dart';
import 'package:transport_management/features/rides/presentation/views/route_today/widgets/tab_bar_widget.dart';
import 'package:transport_management/gen/assets.gen.dart';
import 'package:transport_management/util/resources/r.dart';

class ApplyForLeaveView extends ConsumerWidget {
  const ApplyForLeaveView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaveType = ref.watch(leaveTypeProvider);
    final selectedLeaves = ref.watch(selectedLeavesProvider);

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
                text: context.appLocale.applyForLeave,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
              21.hb,
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26.w),
                    child: Column(
                      children: [
                        TabBarWidget<String>(
                          selected: leaveType.index,
                          itemsList: const ['single', 'multi'],
                          onChanged: (i) {
                            ref.read(leaveTypeProvider.notifier).state =
                                LeaveTypeModel.values[i];
                            ref.read(selectedLeavesProvider.notifier).reset();
                          },
                          itemNames: [
                            context.appLocale.singleDay,
                            context.appLocale.multiDay,
                          ],
                        ),
                        18.hb,
                        CalendarWidget(
                          highlightedDayColor: R.colors.green_337A34,
                          textColor: R.colors.black_FF000000,
                          daysSelected: selectedLeaves,
                          onTapDay: (day) {
                            if (leaveType == LeaveTypeModel.single) {
                              ref
                                  .read(selectedLeavesProvider.notifier)
                                  .updateSingle(
                                    LeaveModel(
                                      day: day.day,
                                      date: day.date,
                                    ),
                                  );
                            } else {
                              ref
                                  .read(selectedLeavesProvider.notifier)
                                  .updateMulti(
                                    LeaveModel(
                                      day: day.day,
                                      date: day.date,
                                    ),
                                  );
                            }
                          },
                        ),
                        16.hb,
                        TextInputField(
                          onChanged: (v) {},
                          hintText: context.appLocale.reason,
                          maxLines: 4,
                          minLines: 4,
                        ),
                        12.hb,
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
                                return AppBottomSheetPopup(
                                  title: context.appLocale.leaveRequestSuccess,
                                  image: Assets.pngs.calendarPopupImage.image(
                                    width: 209.w,
                                    height: 184.h,
                                  ),
                                  onTap: () {
                                    GoRouter.of(context).pop();
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              22.hb,
            ],
          ),
        ),
      ),
    );
  }
}
