import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:navigation/navigation.dart';

import 'bloc/favourites_cubit.dart';
import 'widget/favourites_body.dart';

@RoutePage<String>()
class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavouritesCubit>(
      create: (_) => FavouritesCubit(
        appLocator.get(),
        appLocator.get(),
        appLocator.get(),
      ),
      child: FavouritesBody(),
    );
  }
}
