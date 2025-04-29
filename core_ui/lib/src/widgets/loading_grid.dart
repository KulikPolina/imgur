import 'package:flutter/cupertino.dart';

import '../../core_ui.dart';

class LoadingGrid extends StatelessWidget {
  final int itemCount;

  const LoadingGrid({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Grid(
      itemCount: itemCount,
      builder: (_, __) {
        return Shimmer();
      },
    );
  }
}
