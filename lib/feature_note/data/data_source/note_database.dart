import 'dart:async';

import 'package:floor/floor.dart';
import 'package:notesappflutter/feature_note/data/data_source/note_dao.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'note_database.g.dart';

@Database(version: 1, entities: [Note])
abstract class NoteDatabase extends FloorDatabase {
  NoteDao get noteDao;
}
