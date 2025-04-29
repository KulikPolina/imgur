import 'package:domain/domain.dart';

sealed class FavouritesState {}

class FavouritesLoadingState extends FavouritesState {}

class FavouritesEmptyState extends FavouritesState {}

class FavouritesLoadedState extends FavouritesState {
  final List<PostModel> favourites;

  FavouritesLoadedState({
    required this.favourites,
  });
}
