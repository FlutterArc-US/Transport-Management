import 'package:avcons/common/extensions/app_localization.dart';
import 'package:avcons/common/extensions/num.dart';
import 'package:avcons/common/widgets/app_text.dart';
import 'package:avcons/features/loads/presentation/views/post_truck/widgets/load_tile_widget.dart';
import 'package:flutter/material.dart';

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
