import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart' as shimmer;

import '../../core_ui.dart';


class Shimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return shimmer.Shimmer.fromColors(
      baseColor: AppColors.of(context).primaryBg,
      highlightColor: AppColors.of(context).bottomNavBarColor,
      child: Card(
        color: AppColors.of(context).primaryBg,
      ),
    );
  }

}