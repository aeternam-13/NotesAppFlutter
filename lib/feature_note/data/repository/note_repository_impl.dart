import 'package:notesappflutter/feature_note/data/data_source/note_dao.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDao dao;

  NoteRepositoryImpl(this.dao);

  @override
  Future<void> deleteNote(Note note) => dao.deleteNote(note);

  @override
  Future<Note?> getNoteById(int id) => dao.getNoteById(id);

  @override
  Future<List<Note>> getNotes() => dao.getNotes();

  @override
  Future<void> insertNote(Note note) => dao.insertNote(note);
}
