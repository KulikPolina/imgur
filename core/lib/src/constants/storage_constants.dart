abstract class StorageConstants {
  static const String databaseName = 'imgur.db';

  static const String historyPrefsName = 'history';
  static const int historyMaxLength = 5;

  // Favourites table info
  static const String favouritesTableName = 'Favourites';
  static const String favouritesIdColumn = 'id';
  static const String favouritesTitleColumn = 'title';
  static const String favouritesDescriptionColumn = 'description';
  static const String favouritesDatetimeColumn = 'datetime';

  // Images table
  static const String imagesTableName = 'Images';
  static const String imagesIdColumn = 'id';
  static const String imagesFavoriteIdColumn = 'favoriteId';
  static const String imagesTitleColumn = 'title';
  static const String imagesDescriptionColumn = 'description';
  static const String imagesDatetimeColumn = 'datetime';
  static const String imagesLinkColumn = 'link';
  static const String imagesTypeColumn = 'type';

  // Favorites table commands
  static const String favouritesCreateCommand =
      'CREATE TABLE $favouritesTableName('
      '$favouritesIdColumn TEXT PRIMARY KEY, '
      '$favouritesTitleColumn TEXT, '
      '$favouritesDescriptionColumn TEXT, '
      '$favouritesDatetimeColumn INTEGER)';

  static const String favouritesInsertCommand =
      'INSERT INTO $favouritesTableName('
      '$favouritesIdColumn, '
      '$favouritesTitleColumn, '
      '$favouritesDescriptionColumn, '
      '$favouritesDatetimeColumn) '
      'VALUES(?, ?, ?, ?)';

  static const String favouritesSelectAllCommand =
      'SELECT * FROM $favouritesTableName';

  static const String favouritesSelectByIdCommand =
      'SELECT * FROM $favouritesTableName WHERE $favouritesIdColumn = ?';

  static const String favouritesDeleteCommand =
      'DELETE FROM $favouritesTableName WHERE $favouritesIdColumn = ?';

  // Images table commands
  static const String imagesCreateCommand = 'CREATE TABLE $imagesTableName('
      '$imagesIdColumn TEXT PRIMARY KEY, '
      '$imagesFavoriteIdColumn TEXT NOT NULL, '
      '$imagesTitleColumn TEXT, '
      '$imagesDescriptionColumn TEXT, '
      '$imagesDatetimeColumn INTEGER, '
      '$imagesLinkColumn TEXT, '
      '$imagesTypeColumn TEXT, '
      'CONSTRAINT fk_favourites '
      'FOREIGN KEY($imagesFavoriteIdColumn) '
      'REFERENCES $favouritesTableName($favouritesIdColumn) '
      'ON DELETE CASCADE)';

  static const String imagesInsertCommand = 'INSERT INTO $imagesTableName('
      '$imagesIdColumn, '
      '$imagesFavoriteIdColumn, '
      '$imagesTitleColumn, '
      '$imagesDescriptionColumn, '
      '$imagesDatetimeColumn, '
      '$imagesLinkColumn, '
      '$imagesTypeColumn) '
      'VALUES(?, ?, ?, ?, ?, ?, ?)';

  static const String imagesSelectAllCommand = 'SELECT * FROM $imagesTableName';

  static const String imagesSelectByFavouritesCommand =
      'SELECT * FROM $imagesTableName WHERE $imagesFavoriteIdColumn = ?';

  static const String imagesDeleteByFavouriteCommand =
      'DELETE FROM $imagesTableName WHERE $imagesFavoriteIdColumn = ?';
}
