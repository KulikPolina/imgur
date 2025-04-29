import 'package:core/core.dart';
import 'package:domain/domain.dart';

import '../../data.dart';
import '../repositories/local_history_repository_impl.dart';

abstract class DataDI {
  static Future<void> initDependencies(GetIt locator) async {
    await _initApi(locator);
    _initProviders(locator);
    _initRepositories(locator);
  }

  static Future<void> _initApi(GetIt locator) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    locator.registerLazySingleton<SharedPreferences>(
      () => sharedPreferences,
    );

    locator.registerLazySingleton<DatabaseConfig>(
      DatabaseConfig.new,
    );

    locator.registerLazySingleton<DioConfig>(
      () => DioConfig(
        appConfig: locator<AppConfig>(),
      ),
    );

    locator.registerLazySingleton<ErrorHandler>(
      () => ErrorHandler(
        eventNotifier: locator<AppEventNotifier>(),
      ),
    );
  }

  static void _initProviders(GetIt locator) {
    locator.registerLazySingleton<FavouriteProvider>(
      () => FavouriteProvider(locator<DatabaseConfig>()),
    );

    locator.registerFactory<ImgurProvider>(
      () => ImgurProvider(locator<DioConfig>().dio),
    );

    locator.registerFactory<SearchHistoryProvider>(
      () => SearchHistoryProvider(locator<SharedPreferences>()),
    );
  }

  static void _initRepositories(GetIt locator) {
    locator.registerFactory<LocalFavouritesRepository>(
      () => LocalFavouritesRepositoryImpl(locator<FavouriteProvider>()),
    );

    locator.registerFactory<LocalHistoryRepository>(
      () => LocalHistoryRepositoryImpl(locator<SearchHistoryProvider>()),
    );

    locator.registerFactory<RemoteGalleryRepository>(
      () => RemoteGalleryRepositoryImpl(locator<ImgurProvider>()),
    );
  }
}
