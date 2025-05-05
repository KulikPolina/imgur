import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../../../../data/lib/data.dart';
import '../../../../domain/lib/domain.dart';
import '../enum/providers_instance.dart';

final AuthDI authDI = AuthDI();

class AuthDI {
  

  static Future<void> _initExceptionMappers(GetIt locator) async {
    locator.registerLazySingleton<ExceptionsMapper>(
      () => DioExceptionMapper(),
      instanceName: ProviderInstance.customProviderInstanceName.name,
    );
  }

  static Future<void> _initExceptionHandlers(GetIt locator) async {
    locator.registerLazySingleton<ExceptionsHandler>(
      () => DioExceptionHandler(
        dioExceptionsMapper: locator.get<ExceptionsMapper>(
          instanceName: ProviderInstance.customProviderInstanceName.name,
        ),
      ),
      instanceName: ProviderInstance.customProviderInstanceName.name,
    );
  }

  static Future<void> _initProviders(GetIt locator) async {
    locator.registerLazySingleton<AuthorizationProvider>(
      () => CustomAuthProviderImpl(
        dio: locator.get<Dio>(),
        storage: locator.get<FlutterSecureStorage>(),
        customExceptionHandler: locator.get<ExceptionsHandler>(
            instanceName: ProviderInstance.customProviderInstanceName.name),
      ),
      instanceName: ProviderInstance.customProviderInstanceName.name,
    );

  }

  static Future<void> _initRepositories(GetIt locator, {required ProviderInstance provider}) async {
    locator.registerLazySingleton<AuthorizationRepository>(
      () => AuthorizationRepositoryImpl(
        authProvider: locator.get<AuthorizationProvider>(
          instanceName: provider.name,
        ),
      ),
    );
  }

  static Future<void> _initUseCases(GetIt locator) async {
    locator.registerLazySingleton<SignInWithCredentialsUseCase>(
      () => SignInWithCredentialsUseCase(
        authRepository: locator.get<AuthorizationRepository>(),
      ),
    );


    locator.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(
        authRepository: locator.get<AuthorizationRepository>(),
      ),
    );

    locator.registerLazySingleton<GetCurrentUserUsecase>(
      () => GetCurrentUserUsecase(
        authRepository: locator.get<AuthorizationRepository>(),
      ),
    );

    locator.registerLazySingleton<SignUpWithCredentialsUseCase>(
      () => SignUpWithCredentialsUseCase(
        authRepository: locator.get<AuthorizationRepository>(),
      ),
    );
  }

  static Future<void> _initServices(GetIt locator) async {
    locator.registerLazySingleton<Dio>(
      () => Dio(),
    );
    locator.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage(),
    );
  }

  static Future<void> initDependencies(GetIt locator, {required ProviderInstance provider}) async {
    await _initServices(locator);

    await _initExceptionMappers(locator);
    await _initExceptionHandlers(locator);

    await _initProviders(locator);
    await _initRepositories(locator, provider: provider);

    await _initUseCases(locator);
  }
}
