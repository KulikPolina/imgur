import 'package:domain/domain.dart';

import '../../data.dart';

class LocalFavouritesRepositoryImpl implements LocalFavouritesRepository {
  final FavouriteProvider _favouriteProvider;

  const LocalFavouritesRepositoryImpl(this._favouriteProvider);

  @override
  Future<void> addToFavourite({required PostModel favourite}) async {
    final PostEntity entity = PostMapper.toEntity(favourite);
    await _favouriteProvider.saveFavourite(favourite: entity);
  }

  @override
  Future<List<PostModel>> getFavourites() async {
    final List<PostEntity> result = await _favouriteProvider.getFavourites();
    return result
        .map(
          (PostEntity post) => PostMapper.fromEntity(
            post,
            isFavourite: true,
          ),
        )
        .toList();
  }

  @override
  Future<void> removeFromFavourite({required String favouriteId}) {
    return _favouriteProvider.removeFavourite(favouriteId: favouriteId);
  }

  @override
  Future<bool> isFavourite({required String favouriteId}) {
    return _favouriteProvider.isFavourite(favouriteId: favouriteId);
  }

  @override
  Stream<List<PostModel>> get favouritesStream {
    return _favouriteProvider.favouritesStream.map(
      (List<PostEntity> favourites) => favourites
          .map(
            (PostEntity post) => PostMapper.fromEntity(
              post,
              isFavourite: true,
            ),
          )
          .toList(),
    );
  }
}
