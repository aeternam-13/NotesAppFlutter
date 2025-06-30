import 'package:multiple_result/multiple_result.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/model/note_exception.dart';

abstract class NoteDao {
  Stream<Result<List<Note>, NoteException>> getNotes();

  Future<Note?> getNoteById(int id);

  Future<Result<Unit, NoteException>> insertNote(Note note);

  Future<Result<Unit, NoteException>> deleteNote(int id);
}
