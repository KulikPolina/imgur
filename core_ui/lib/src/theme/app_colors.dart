import 'package:flutter/material.dart';

import '../../core_ui.dart';

abstract class AppColors {
  factory AppColors.of(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    return brightness == Brightness.light
        ? const LightColors()
        : const DarkColors();
  }

  Color get primaryBg;

  Color get white;

  Color get black;

  Color get selectedTabColor;

  Color get unselectedTabColor;

  Color get bottomNavBarColor;

  Color get appBarColor;

  Color get shadowColor;

  Color get favouriteColor;

  Color get searchBarColor;

  LinearGradient get shimmerGradient;
}

class DarkColors extends LightColors {
  const DarkColors();
}

class LightColors implements AppColors {
  const LightColors();

  @override
  // RGBO(236, 239, 241, 1)
  Color get primaryBg => const Color(0xFFeceff1);

  @override
  Color get white => const Color.fromRGBO(255, 255, 255, 1);

  @override
  Color get black => Colors.black;

  @override
  Color get selectedTabColor => Colors.black;

  @override
  Color get unselectedTabColor =>
      Colors.black.withOpacity(AppDimens.tabUnselectedColorOpacity);

  @override
  Color get bottomNavBarColor => const Color.fromRGBO(254, 247, 255, 1);

  @override
  Color get appBarColor => bottomNavBarColor.withOpacity(0.1);

  @override
  Color get shadowColor => Colors.grey;

  @override
  Color get favouriteColor => Colors.red;

  @override
  Color get searchBarColor => Colors.white;

  @override
  LinearGradient get shimmerGradient => const LinearGradient(
        colors: <Color>[
          Color(0xFFEBEBF4),
          Color(0xFFF4F4F4),
          Color(0xFFEBEBF4),
        ],
        stops: <double>[
          0.1,
          0.3,
          0.4,
        ],
        begin: Alignment(-1.0, -0.3),
        end: Alignment(1.0, 0.3),
        tileMode: TileMode.clamp,
      );
}
