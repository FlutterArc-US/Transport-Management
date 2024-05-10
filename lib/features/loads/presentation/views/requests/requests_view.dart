import 'package:flutter/material.dart';
import 'package:transport_management/common/extensions/app_localization.dart';
import 'package:transport_management/common/extensions/num.dart';
import 'package:transport_management/common/widgets/app_text.dart';
import 'package:transport_management/features/loads/presentation/views/post_truck/widgets/load_tile_widget.dart';

class RequestsView extends StatelessWidget {
  const RequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          text: context.appLocale.requests,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        24.hb,
        const LoadTileWidget(),
      ],
    );
  }
}
