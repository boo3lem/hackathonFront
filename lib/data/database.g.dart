// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

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

  PlaceDao? _placeDaoInstance;

  TerminalDao? _terminalDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `Place` (`id` INTEGER NOT NULL, `title_ar` TEXT NOT NULL, `title_fr` TEXT NOT NULL, `title_en` TEXT NOT NULL, `lant` REAL NOT NULL, `lang` REAL NOT NULL, `description_ar` TEXT NOT NULL, `description_fr` TEXT NOT NULL, `description_en` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Terminal` (`id` INTEGER NOT NULL, `lant` REAL NOT NULL, `lang` REAL NOT NULL, `title` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PlaceDao get placeDao {
    return _placeDaoInstance ??= _$PlaceDao(database, changeListener);
  }

  @override
  TerminalDao get terminalDao {
    return _terminalDaoInstance ??= _$TerminalDao(database, changeListener);
  }
}

class _$PlaceDao extends PlaceDao {
  _$PlaceDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _placeInsertionAdapter = InsertionAdapter(
            database,
            'Place',
            (Place item) => <String, Object?>{
                  'id': item.id,
                  'title_ar': item.title_ar,
                  'title_fr': item.title_fr,
                  'title_en': item.title_en,
                  'lant': item.lant,
                  'lang': item.lang,
                  'description_ar': item.description_ar,
                  'description_fr': item.description_fr,
                  'description_en': item.description_en
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Place> _placeInsertionAdapter;

  @override
  Future<List<Place>> findAllPlaces() async {
    return _queryAdapter.queryList('SELECT * FROM Place',
        mapper: (Map<String, Object?> row) => Place(
            row['id'] as int,
            row['title_ar'] as String,
            row['title_fr'] as String,
            row['title_en'] as String,
            row['lant'] as double,
            row['lang'] as double,
            row['description_ar'] as String,
            row['description_fr'] as String,
            row['description_en'] as String));
  }

  @override
  Stream<Place?> findPlaceById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Place WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Place(
            row['id'] as int,
            row['title_ar'] as String,
            row['title_fr'] as String,
            row['title_en'] as String,
            row['lant'] as double,
            row['lang'] as double,
            row['description_ar'] as String,
            row['description_fr'] as String,
            row['description_en'] as String),
        arguments: [id],
        queryableName: 'Place',
        isView: false);
  }

  @override
  Future<void> insertPlace(Place place) async {
    await _placeInsertionAdapter.insert(place, OnConflictStrategy.abort);
  }
}

class _$TerminalDao extends TerminalDao {
  _$TerminalDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _terminalInsertionAdapter = InsertionAdapter(
            database,
            'Terminal',
            (Terminal item) => <String, Object?>{
                  'id': item.id,
                  'lant': item.lant,
                  'lang': item.lang,
                  'title': item.title
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Terminal> _terminalInsertionAdapter;

  @override
  Future<List<Terminal>> findAllPlaces() async {
    return _queryAdapter.queryList('SELECT * FROM Terminal',
        mapper: (Map<String, Object?> row) => Terminal(
            row['id'] as int,
            row['lant'] as double,
            row['lang'] as double,
            row['title'] as String));
  }

  @override
  Stream<Terminal?> findPlaceById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Terminal WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Terminal(
            row['id'] as int,
            row['lant'] as double,
            row['lang'] as double,
            row['title'] as String),
        arguments: [id],
        queryableName: 'Terminal',
        isView: false);
  }

  @override
  Future<void> insertPlace(Terminal terminal) async {
    await _terminalInsertionAdapter.insert(terminal, OnConflictStrategy.abort);
  }
}
