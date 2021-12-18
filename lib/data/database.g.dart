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

  PavionDao? _pavionDaoInstance;

  TerminalDao? _terminalDaoInstance;

  ExposantDao? _exposantDaoInstance;

  StandDao? _standDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `Pavion` (`id` INTEGER NOT NULL, `title` TEXT NOT NULL, `lat` REAL NOT NULL, `lng` REAL NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Terminal` (`id` INTEGER NOT NULL, `lat` REAL NOT NULL, `lng` REAL NOT NULL, `title` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Exposant` (`id` INTEGER NOT NULL, `title` TEXT NOT NULL, `description` TEXT NOT NULL, `website` TEXT NOT NULL, `logo` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Stand` (`id` INTEGER NOT NULL, `title` TEXT NOT NULL, `idPavion` INTEGER NOT NULL, `idExposant` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PavionDao get pavionDao {
    return _pavionDaoInstance ??= _$PavionDao(database, changeListener);
  }

  @override
  TerminalDao get terminalDao {
    return _terminalDaoInstance ??= _$TerminalDao(database, changeListener);
  }

  @override
  ExposantDao get exposantDao {
    return _exposantDaoInstance ??= _$ExposantDao(database, changeListener);
  }

  @override
  StandDao get standDao {
    return _standDaoInstance ??= _$StandDao(database, changeListener);
  }
}

class _$PavionDao extends PavionDao {
  _$PavionDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _pavionInsertionAdapter = InsertionAdapter(
            database,
            'Pavion',
            (Pavion item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'lat': item.lat,
                  'lng': item.lng
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Pavion> _pavionInsertionAdapter;

  @override
  Future<List<Pavion>> findAllPavions() async {
    return _queryAdapter.queryList('SELECT * FROM Pavion',
        mapper: (Map<String, Object?> row) => Pavion(
            row['id'] as int,
            row['title'] as String,
            row['lat'] as double,
            row['lng'] as double));
  }

  @override
  Stream<Pavion?> findPavionById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Pavion WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Pavion(row['id'] as int,
            row['title'] as String, row['lat'] as double, row['lng'] as double),
        arguments: [id],
        queryableName: 'Pavion',
        isView: false);
  }

  @override
  Future<Pavion?> findPavionByTitle(String motif) async {
    return _queryAdapter.query('SELECT * FROM Pavion WHERE title LIKE ?1',
        mapper: (Map<String, Object?> row) => Pavion(row['id'] as int,
            row['title'] as String, row['lat'] as double, row['lng'] as double),
        arguments: [motif]);
  }

  @override
  Future<void> insertPavion(Pavion pavion) async {
    await _pavionInsertionAdapter.insert(pavion, OnConflictStrategy.abort);
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
                  'lat': item.lat,
                  'lng': item.lng,
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
            row['lat'] as double,
            row['lng'] as double,
            row['title'] as String));
  }

  @override
  Stream<Terminal?> findPlaceById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Terminal WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Terminal(row['id'] as int,
            row['lat'] as double, row['lng'] as double, row['title'] as String),
        arguments: [id],
        queryableName: 'Terminal',
        isView: false);
  }

  @override
  Future<Terminal?> findTerminalByTitle(String motif) async {
    return _queryAdapter.query('SELECT * FROM Terminal WHERE title LIKE ?1',
        mapper: (Map<String, Object?> row) => Terminal(row['id'] as int,
            row['lat'] as double, row['lng'] as double, row['title'] as String),
        arguments: [motif]);
  }

  @override
  Future<void> insertPlace(Terminal terminal) async {
    await _terminalInsertionAdapter.insert(terminal, OnConflictStrategy.abort);
  }
}

class _$ExposantDao extends ExposantDao {
  _$ExposantDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _exposantInsertionAdapter = InsertionAdapter(
            database,
            'Exposant',
            (Exposant item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'website': item.website,
                  'logo': item.logo
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Exposant> _exposantInsertionAdapter;

  @override
  Future<List<Exposant>> findAllExposants() async {
    return _queryAdapter.queryList('SELECT * FROM Exposant',
        mapper: (Map<String, Object?> row) => Exposant(
            row['id'] as int,
            row['title'] as String,
            row['description'] as String,
            row['website'] as String,
            row['logo'] as String));
  }

  @override
  Future<Exposant?> findExposantById(int id) async {
    return _queryAdapter.query('SELECT * FROM Exposant WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Exposant(
            row['id'] as int,
            row['title'] as String,
            row['description'] as String,
            row['website'] as String,
            row['logo'] as String),
        arguments: [id]);
  }

  @override
  Future<Exposant?> findExposantByTitle(String motif) async {
    return _queryAdapter.query('SELECT * FROM Exposant WHERE title LIKE ?1',
        mapper: (Map<String, Object?> row) => Exposant(
            row['id'] as int,
            row['title'] as String,
            row['description'] as String,
            row['website'] as String,
            row['logo'] as String),
        arguments: [motif]);
  }

  @override
  Future<void> insertExposant(Exposant exposant) async {
    await _exposantInsertionAdapter.insert(exposant, OnConflictStrategy.abort);
  }

  @override
  Future<List<Exposant>> findExposantsByTitle(String motif) {
    // TODO: implement findExposantsByTitle
    throw UnimplementedError();
  }
}

class _$StandDao extends StandDao {
  _$StandDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _standInsertionAdapter = InsertionAdapter(
            database,
            'Stand',
            (Stand item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'idPavion': item.idPavion,
                  'idExposant': item.idExposant
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Stand> _standInsertionAdapter;

  @override
  Future<List<Stand>> findAllStands() async {
    return _queryAdapter.queryList('SELECT * FROM Stand',
        mapper: (Map<String, Object?> row) => Stand(
            row['id'] as int,
            row['title'] as String,
            row['idPavion'] as int,
            row['idExposant'] as int));
  }

  @override
  Future<Stand?> findStandById(int id) async {
    return _queryAdapter.query('SELECT * FROM Stand WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Stand(
            row['id'] as int,
            row['title'] as String,
            row['idPavion'] as int,
            row['idExposant'] as int),
        arguments: [id]);
  }

  @override
  Future<Stand?> findStandByTitle(String motif) async {
    return _queryAdapter.query('SELECT * FROM Stand WHERE title LIKE ?1',
        mapper: (Map<String, Object?> row) => Stand(
            row['id'] as int,
            row['title'] as String,
            row['idPavion'] as int,
            row['idExposant'] as int),
        arguments: [motif]);
  }

  @override
  Future<void> insertStand(Stand stand) async {
    await _standInsertionAdapter.insert(stand, OnConflictStrategy.abort);
  }
}
