import 'package:transport_management/features/support/domain/models/ticket_model.dart';
import 'package:transport_management/features/support/presentation/providers/get_all_tickets_provider/get_all_tickets_provider.dart';
import 'package:transport_management/features/support/presentation/views/tickets/widgets/ticket_tile_widget.dart';
import 'package:transport_management/features/support/presentation/views/tickets/widgets/tickets_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketsListWidget extends ConsumerWidget {
  const TicketsListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final ticketsAsync = ref.watch(getAllTicketsProvider);
    //
    // if (!ticketsAsync.hasValue) {
    //   return const TicketsLoadingWidget();
    // }
    //
    // final tickets = ticketsAsync.value;

    // return tickets == null || tickets.isEmpty
    //     ? const SizedBox()
    //     :

    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return TicketTileWidget(
            ticket: TicketModel(
              id: 1,
              message: 'Hello',
              status: 'pending',
              response: 'Hello',
              lastUpdated: '12/3/2024',
            ),
          );
        },
      ),
    );
  }
}
