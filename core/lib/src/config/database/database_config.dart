import '../../../core.dart';

class DatabaseConfig {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await openDatabase(
      StorageConstants.databaseName,
      version: 1,
      onCreate: (Database db, _) async {
        await db.execute(StorageConstants.favouritesCreateCommand);
        await db.execute(StorageConstants.imagesCreateCommand);
      },
    );

    return _database!;
  }

  Future<void> closeDatabase() async {
    await _database?.close();
  }
}
