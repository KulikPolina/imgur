import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'error_handler/provider/app_error_handler_provider.dart';
  

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  
  await _setupDI(Flavor.dev);

  runApp(const App());
}

Future<void> _setupDI(Flavor flavor) async {
  appLocator.pushNewScope(
    scopeName: unauthScope,
    init: (_) async {
      AppDI.initDependencies(appLocator, flavor);
      await DataDI.initDependencies(appLocator);
      DomainDI.initDependencies(appLocator);
      NavigationDI.initDependencies(appLocator);
    },
  );

  await appLocator.allReady();
}
  

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = appLocator<AppRouter>();

    return EasyLocalization(
      path: AppLocalization.langFolderPath,
      supportedLocales: AppLocalization.supportedLocales,
      fallbackLocale: AppLocalization.fallbackLocale,
      child: Builder(
        builder: (BuildContext context) {
          return AppErrorHandlerProvider(
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: appRouter.config(),
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: lightTheme,
            ),
          );
        },
      ),
    );
  }
}
  
  