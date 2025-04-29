import 'package:flutter/material.dart';

import '../../core_ui.dart';

const LightColors _appColors = LightColors();

final ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: _appColors.white,
  appBarTheme: _getAppBarTheme(),
  textTheme: _getTextTheme(),
  inputDecorationTheme: _getInputDecorationTheme(),
  bottomNavigationBarTheme: _getBottomNavigationTheme(),
  primaryColor: _appColors.primaryBg,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: _appColors.primaryBg,
    primary: _appColors.primaryBg,
  ),
);

AppBarTheme _getAppBarTheme() {
  return AppBarTheme(
    backgroundColor: _appColors.appBarColor,
  );
}

BottomNavigationBarThemeData _getBottomNavigationTheme() {
  return BottomNavigationBarThemeData(
    backgroundColor: _appColors.bottomNavBarColor,
    unselectedIconTheme: IconThemeData(
      color: _appColors.unselectedTabColor,
    ),
    unselectedItemColor: _appColors.unselectedTabColor,
    selectedIconTheme: IconThemeData(
      color: _appColors.selectedTabColor,
    ),
    selectedItemColor: _appColors.selectedTabColor,
  );
}

TextTheme _getTextTheme() {
  return TextTheme(
    titleMedium: AppFonts.normal13,
    bodyMedium: AppFonts.normal13,
    titleLarge: AppFonts.normal20,
  ).apply(
    bodyColor: _appColors.black,
    displayColor: _appColors.black,
  );
}

InputDecorationTheme _getInputDecorationTheme() {
  return InputDecorationTheme(
    hintStyle: AppFonts.normal13.copyWith(color: _appColors.primaryBg),
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.BORDER_RADIUS_12),
      ),
      borderSide: BorderSide(
        color: _appColors.primaryBg,
        width: 2,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.BORDER_RADIUS_12),
      ),
      borderSide: BorderSide(
        color: _appColors.primaryBg,
        width: 2,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.BORDER_RADIUS_12),
      ),
      borderSide: BorderSide(
        color: _appColors.primaryBg,
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.BORDER_RADIUS_6),
      ),
      borderSide: BorderSide(
        color: _appColors.primaryBg,
        width: 2,
      ),
    ),
    labelStyle: AppFonts.normal13.copyWith(color: _appColors.primaryBg),
  );
}
