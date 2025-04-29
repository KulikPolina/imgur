import '../../core.dart';

final GetIt appLocator = GetIt.instance;

const String unauthScope = 'unauthScope';
const String authScope = 'authScope';

abstract class AppDI {
  static void initDependencies(GetIt locator, Flavor flavor) {
    locator.registerSingleton<AppConfig>(
      AppConfig.fromFlavor(flavor),
    );

    locator.registerLazySingleton<AppEventBus>(
      AppEventBus.new,
    );

    locator.registerLazySingleton<AppEventNotifier>(
      appLocator<AppEventBus>,
    );

    locator.registerLazySingleton<AppEventObserver>(
      appLocator<AppEventBus>,
    );
  }
}
