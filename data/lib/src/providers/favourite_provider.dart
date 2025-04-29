import 'dart:async';

import 'package:core/core.dart';

import '../../data.dart';

class FavouriteProvider {
  final DatabaseConfig _databaseConfig;

  FavouriteProvider(this._databaseConfig);

  final StreamController<List<PostEntity>> _streamController =
      StreamController<List<PostEntity>>();

  List<PostEntity> _currentFavourites = <PostEntity>[];

  Stream<List<PostEntity>> get favouritesStream => _streamController.stream;

  Future<bool> isFavourite({
    required String favouriteId,
  }) async {
    final Database database = await _databaseConfig.database;
    final List<Map<String, Object?>> rawFavourites = await database.rawQuery(
      StorageConstants.favouritesSelectByIdCommand,
      <Object?>[favouriteId],
    );

    return rawFavourites.isNotEmpty;
  }

  Future<void> saveFavourite({
    required PostEntity favourite,
  }) async {
    final Database database = await _databaseConfig.database;

    await database.rawInsert(
      StorageConstants.favouritesInsertCommand,
      <Object?>[
        favourite.id,
        favourite.title,
        favourite.description,
        favourite.datetime,
      ],
    );

    final List<ImageEntity>? images = favourite.images;
    if (images == null) return;

    for (final ImageEntity image in images) {
      await database.rawInsert(
        StorageConstants.imagesInsertCommand,
        <Object?>[
          image.id,
          favourite.id,
          image.title,
          image.description,
          image.datetime,
          image.link,
          image.type,
        ],
      );
    }

    final List<PostEntity> favourites = List<PostEntity>.of(_currentFavourites)
      ..add(favourite);
    _currentFavourites = favourites;
    _streamController.add(_currentFavourites);
  }

  Future<void> removeFavourite({
    required String favouriteId,
  }) async {
    final Database database = await _databaseConfig.database;

    await database.rawDelete(
      StorageConstants.favouritesDeleteCommand,
      <Object?>[favouriteId],
    );

    await database.rawDelete(
      StorageConstants.imagesDeleteByFavouriteCommand,
      <Object?>[favouriteId],
    );

    final List<PostEntity> favourites = _currentFavourites
        .where((PostEntity favourite) => favourite.id != favouriteId)
        .toList();
    _currentFavourites = favourites;
    _streamController.add(_currentFavourites);
  }

  Future<List<PostEntity>> getFavourites() async {
    final Database database = await _databaseConfig.database;

    final List<PostEntity> result = <PostEntity>[];

    final List<Map<String, Object?>> rawFavourites = await database.rawQuery(
      StorageConstants.favouritesSelectAllCommand,
    );

    for (final Map<String, Object?> json in rawFavourites) {
      final Object? id = json[StorageConstants.favouritesIdColumn];
      final List<Map<String, Object?>> rawImages = await database.rawQuery(
        StorageConstants.imagesSelectByFavouritesCommand,
        <Object?>[id],
      );

      final Map<String, Object?> rawPost = <String, Object?>{
        ...json,
        'images': rawImages,
      };

      result.add(PostEntity.fromJson(rawPost));
    }

    _currentFavourites = result;
    _streamController.add(_currentFavourites);

    return result;
  }
}
