import 'package:flutter/material.dart';

import '../../core_ui.dart';

class ImageCard extends StatelessWidget {
  final Widget child;

  const ImageCard({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          AppDimens.BORDER_RADIUS_8,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.of(context).shadowColor,
            offset: const Offset(AppDimens.OFFSET_0, AppDimens.OFFSET_4),
            blurRadius: AppDimens.RADIUS_8,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.PADDING_10),
        child: child,
      ),
    );
  }
}
