import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../bloc/favourites_cubit.dart';
import '../bloc/favourites_state.dart';
import 'favourites_empty.dart';
import 'favourites_loaded.dart';
import 'favourites_loading.dart';

class FavouritesBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr('titles.favourites'),
        ),
      ),
      body: BlocBuilder<FavouritesCubit, FavouritesState>(
          builder: (_, FavouritesState state) {
        return switch (state) {
          FavouritesLoadingState() => FavouritesLoading(),
          FavouritesLoadedState() => FavouritesLoaded(
              favourites: state.favourites,
            ),
          FavouritesEmptyState() => FavouritesEmpty(),
        };
      }),
    );
  }
}
