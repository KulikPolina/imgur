import 'dart:ui';

abstract final class AppLocalization {
  static const String langFolderPath = 'packages/core/resources/lang';

  static const List<Locale> supportedLocales = <Locale>[
    _enLocale,
  ];

  static Locale get fallbackLocale => _enLocale;

  static const Locale _enLocale = Locale('en', 'US');
}
