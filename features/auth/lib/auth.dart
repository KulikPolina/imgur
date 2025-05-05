import 'package:navigation/navigation.dart';

export 'auth.gm.dart';
export 'src/core/lib/core.dart';
export 'src/domain/lib/domain.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Page|Form,Route')
class AuthModule extends $AuthModule {}
