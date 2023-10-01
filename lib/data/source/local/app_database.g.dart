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

  ProductDao? _daoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
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
            'CREATE TABLE IF NOT EXISTS `ProductEntity` (`id` INTEGER NOT NULL, `imageUrl` TEXT NOT NULL, `name` TEXT NOT NULL, `category` TEXT NOT NULL, `isSaved` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ProductDao get dao {
    return _daoInstance ??= _$ProductDao(database, changeListener);
  }
}

class _$ProductDao extends ProductDao {
  _$ProductDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _productEntityInsertionAdapter = InsertionAdapter(
            database,
            'ProductEntity',
            (ProductEntity item) => <String, Object?>{
                  'id': item.id,
                  'imageUrl': item.imageUrl,
                  'name': item.name,
                  'category': item.category,
                  'isSaved': item.isSaved ? 1 : 0
                }),
        _productEntityDeletionAdapter = DeletionAdapter(
            database,
            'ProductEntity',
            ['id'],
            (ProductEntity item) => <String, Object?>{
                  'id': item.id,
                  'imageUrl': item.imageUrl,
                  'name': item.name,
                  'category': item.category,
                  'isSaved': item.isSaved ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ProductEntity> _productEntityInsertionAdapter;

  final DeletionAdapter<ProductEntity> _productEntityDeletionAdapter;

  @override
  Future<List<ProductEntity>> getAllItems() async {
    return _queryAdapter.queryList('SELECT * FROM ProductEntity',
        mapper: (Map<String, Object?> row) => ProductEntity(
            id: row['id'] as int,
            imageUrl: row['imageUrl'] as String,
            name: row['name'] as String,
            category: row['category'] as String,
            isSaved: (row['isSaved'] as int) != 0));
  }

  @override
  Future<void> addItem(ProductEntity floorEntity) async {
    await _productEntityInsertionAdapter.insert(
        floorEntity, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteItem(ProductEntity floorEntity) async {
    await _productEntityDeletionAdapter.delete(floorEntity);
  }
}
