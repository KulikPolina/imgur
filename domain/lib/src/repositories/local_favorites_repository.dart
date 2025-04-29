import '../models/models.dart';

abstract interface class LocalFavouritesRepository {
  Stream<List<PostModel>> get favouritesStream;

  Future<List<PostModel>> getFavourites();

  Future<void> addToFavourite({
    required PostModel favourite,
  });

  Future<void> removeFromFavourite({
    required String favouriteId,
  });

  Future<bool> isFavourite({
    required String favouriteId,
  });
}
