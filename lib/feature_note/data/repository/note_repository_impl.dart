import 'package:multiple_result/multiple_result.dart';
import 'package:notesappflutter/feature_note/data/data_source/note_dao.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/model/note_exception.dart';
import 'package:notesappflutter/feature_note/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  NoteDao _dao;

  NoteRepositoryImpl(this._dao);

  @override
  Future<Result<Unit, NoteException>> deleteNote(int id) => _dao.deleteNote(id);

  @override
  Future<Note?> getNoteById(int id) => _dao.getNoteById(id);

  @override
  Stream<Result<List<Note>, NoteException>> getNotes() => _dao.getNotes();

  @override
  Future<Result<Unit, NoteException>> insertNote(Note note) =>
      _dao.updateNote(note);

  @override
  Future<Result<Unit, NoteException>> saveNote(Note note) =>
      _dao.saveNote(note);

  @override
  void setDao(NoteDao dao) {
    _dao = dao;
  }
}
