import 'package:notesappflutter/feature_note/data/data_source/note_dao.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDao _dao;

  NoteRepositoryImpl(this._dao);

  @override
  Future<void> deleteNote(Note note) => _dao.deleteNote(note);

  @override
  Future<Note?> getNoteById(int id) => _dao.getNoteById(id);

  @override
  Future<List<Note>> getNotes() => _dao.getNotes();

  @override
  Future<void> insertNote(Note note) => _dao.insertNote(note);
}
