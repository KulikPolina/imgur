import 'package:navigation/navigation.dart';

import 'favourites.gm.dart';

export 'package:favourites/src/favourites_page.dart';

export 'favourites.gm.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Page|Form,Route')
class FavouritesModule extends $FavouritesModule {}
