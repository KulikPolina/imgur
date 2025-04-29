import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ImagesLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const LoadingGrid(
      itemCount: AppDimens.loadingItemsCount,
    );
  }
}
