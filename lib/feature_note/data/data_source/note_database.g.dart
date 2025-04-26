// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $NoteDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $NoteDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $NoteDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<NoteDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorNoteDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $NoteDatabaseBuilderContract databaseBuilder(String name) =>
      _$NoteDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $NoteDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$NoteDatabaseBuilder(null);
}

class _$NoteDatabaseBuilder implements $NoteDatabaseBuilderContract {
  _$NoteDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $NoteDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $NoteDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<NoteDatabase> build() async {
    final path =
        name != null
            ? await sqfliteDatabaseFactory.getDatabasePath(name!)
            : ':memory:';
    final database = _$NoteDatabase();
    database.database = await database.open(path, _migrations, _callback);
    return database;
  }
}

class _$NoteDatabase extends NoteDatabase {
  _$NoteDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  NoteDao? _noteDaoInstance;

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
          database,
          startVersion,
          endVersion,
          migrations,
        );

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
          'CREATE TABLE IF NOT EXISTS `Note` (`title` TEXT NOT NULL, `content` TEXT NOT NULL, `timestamp` INTEGER NOT NULL, `color` INTEGER NOT NULL, `id` INTEGER NOT NULL, PRIMARY KEY (`id`))',
        );

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  NoteDao get noteDao {
    return _noteDaoInstance ??= _$NoteDao(database, changeListener);
  }
}

class _$NoteDao extends NoteDao {
  _$NoteDao(this.database, this.changeListener)
    : _queryAdapter = QueryAdapter(database, changeListener),
      _noteInsertionAdapter = InsertionAdapter(
        database,
        'Note',
        (Note item) => <String, Object?>{
          'title': item.title,
          'content': item.content,
          'timestamp': item.timestamp,
          'color': item.color,
          'id': item.id,
        },
        changeListener,
      ),
      _noteDeletionAdapter = DeletionAdapter(
        database,
        'Note',
        ['id'],
        (Note item) => <String, Object?>{
          'title': item.title,
          'content': item.content,
          'timestamp': item.timestamp,
          'color': item.color,
          'id': item.id,
        },
        changeListener,
      );

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Note> _noteInsertionAdapter;

  final DeletionAdapter<Note> _noteDeletionAdapter;

  @override
  Stream<List<Note>> getNotes() {
    return _queryAdapter.queryListStream(
      'SELECT * FROM note',
      mapper:
          (Map<String, Object?> row) => Note(
            title: row['title'] as String,
            content: row['content'] as String,
            timestamp: row['timestamp'] as int,
            color: row['color'] as int,
            id: row['id'] as int,
          ),
      queryableName: 'note',
      isView: false,
    );
  }

  @override
  Future<Note?> getNoteById(int id) async {
    return _queryAdapter.query(
      'SELECT * FROM note WHERE id = ?1',
      mapper:
          (Map<String, Object?> row) => Note(
            title: row['title'] as String,
            content: row['content'] as String,
            timestamp: row['timestamp'] as int,
            color: row['color'] as int,
            id: row['id'] as int,
          ),
      arguments: [id],
    );
  }

  @override
  Future<void> insertNote(Note note) async {
    await _noteInsertionAdapter.insert(note, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteNote(Note note) async {
    await _noteDeletionAdapter.delete(note);
  }
}
