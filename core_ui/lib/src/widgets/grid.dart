import 'package:flutter/cupertino.dart';

import '../../core_ui.dart';

class Grid extends StatelessWidget {
  final int itemCount;
  final NullableIndexedWidgetBuilder builder;
  final ScrollController? controller;
  final ScrollPhysics? physics;

  const Grid({
    super.key,
    required this.itemCount,
    required this.builder,
    this.controller,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: physics,
      controller: controller,
      itemCount: itemCount,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.PADDING_10,
        vertical: AppDimens.PADDING_10,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: AppDimens.gridImagesCount,
        mainAxisSpacing: AppDimens.PADDING_10,
        crossAxisSpacing: AppDimens.PADDING_10,
      ),
      itemBuilder: builder,
    );
  }
}
