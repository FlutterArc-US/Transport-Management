import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_filled_button.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/common/widgets/back_button_widget.dart';
import 'package:transport_management/common/widgets/text_input_field.dart';
import 'package:transport_management/features/support/presentation/providers/create_ticket_provider/create_ticket_provider.dart';
import 'package:transport_management/features/support/presentation/providers/get_all_tickets_provider/get_all_tickets_provider.dart';
import 'package:transport_management/util/exceptions/message_exception.dart';
import 'package:transport_management/util/loading/loading.dart';
import 'package:transport_management/util/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CreateNewTicketView extends ConsumerStatefulWidget {
  const CreateNewTicketView({super.key});

  @override
  ConsumerState<CreateNewTicketView> createState() =>
      _CreateNewTicketViewState();
}

class _CreateNewTicketViewState extends ConsumerState<CreateNewTicketView> {
  final _formKey = GlobalKey<FormState>();

  final _messageInputController = TextEditingController();

  Future<void> _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        loading(context);
        await ref
            .read(createTicketProvider(_messageInputController.text).future);
        if (!mounted) return;
        showToast(msg: context.appLocale.requestSubmittedSuccessfully);
        ref.invalidate(getAllTicketsProvider);
        GoRouter.of(context).pop();
      } on MessageException catch (e) {
        showToast(msg: e.message);
      } catch (e) {
        debugPrint('$e');
      } finally {
        dismissLoading();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              MediaQuery.of(context).padding.top.hb,
              const BackButtonWidget(),
              20.49.hb,
              AppText(
                text: context.appLocale.createNewTicket,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              25.hb,
              TextInputField(
                onChanged: (v) {},
                hintText: context.appLocale.message,
                maxLines: 6,
                controller: _messageInputController,
                minLines: 6,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Please enter a message';
                  }

                  return null;
                },
              ),
              const Spacer(),
              AppFilledButton(
                width: 330,
                text: context.appLocale.submitRequest,
                onTap: _submit,
              ),
              30.hb,
            ],
          ),
        ),
      ),
    );
  }
}
