// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  FavoriteDao? _favoriteDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `favorite` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `date` TEXT, `tempC` REAL, `tempF` REAL, `urlIcon` TEXT, `region` TEXT, `country` TEXT, `latLong` TEXT, `humidity` INTEGER, `wind` REAL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FavoriteDao get favoriteDao {
    return _favoriteDaoInstance ??= _$FavoriteDao(database, changeListener);
  }
}

class _$FavoriteDao extends FavoriteDao {
  _$FavoriteDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _favoriteInsertionAdapter = InsertionAdapter(
            database,
            'favorite',
            (Favorite item) => <String, Object?>{
                  'id': item.id,
                  'date': item.date,
                  'tempC': item.tempC,
                  'tempF': item.tempF,
                  'urlIcon': item.urlIcon,
                  'region': item.region,
                  'country': item.country,
                  'latLong': item.latLong,
                  'humidity': item.humidity,
                  'wind': item.wind
                }),
        _favoriteUpdateAdapter = UpdateAdapter(
            database,
            'favorite',
            ['id'],
            (Favorite item) => <String, Object?>{
                  'id': item.id,
                  'date': item.date,
                  'tempC': item.tempC,
                  'tempF': item.tempF,
                  'urlIcon': item.urlIcon,
                  'region': item.region,
                  'country': item.country,
                  'latLong': item.latLong,
                  'humidity': item.humidity,
                  'wind': item.wind
                }),
        _favoriteDeletionAdapter = DeletionAdapter(
            database,
            'favorite',
            ['id'],
            (Favorite item) => <String, Object?>{
                  'id': item.id,
                  'date': item.date,
                  'tempC': item.tempC,
                  'tempF': item.tempF,
                  'urlIcon': item.urlIcon,
                  'region': item.region,
                  'country': item.country,
                  'latLong': item.latLong,
                  'humidity': item.humidity,
                  'wind': item.wind
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Favorite> _favoriteInsertionAdapter;

  final UpdateAdapter<Favorite> _favoriteUpdateAdapter;

  final DeletionAdapter<Favorite> _favoriteDeletionAdapter;

  @override
  Future<List<Favorite>> getAllFavorite() async {
    return _queryAdapter.queryList('SELECT * FROM favorite',
        mapper: (Map<String, Object?> row) => Favorite(
            id: row['id'] as int?,
            date: row['date'] as String?,
            tempC: row['tempC'] as double?,
            tempF: row['tempF'] as double?,
            urlIcon: row['urlIcon'] as String?,
            region: row['region'] as String?,
            country: row['country'] as String?,
            latLong: row['latLong'] as String?,
            humidity: row['humidity'] as int?,
            wind: row['wind'] as double?));
  }

  @override
  Future<int> insertCountryForFavorite(Favorite favorite) {
    return _favoriteInsertionAdapter.insertAndReturnId(
        favorite, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateCountryInFavorite(Favorite favorite) async {
    return await _favoriteUpdateAdapter.updateAndReturnChangedRows(
        favorite, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteCountryFromFavorite(Favorite favorite) {
    return _favoriteDeletionAdapter.deleteAndReturnChangedRows(favorite);
  }
}
