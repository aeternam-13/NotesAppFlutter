import 'package:multiple_result/multiple_result.dart';
import 'package:notesappflutter/feature_note/data/data_source/note_dao.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/model/note_exception.dart';

class NoteDaoApi extends NoteDao {
  final String _baseUrl = "http://localhost:8080/notes/";

  @override
  Future<void> deleteNote(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Note?> getNoteById(int id) {
    throw UnimplementedError();
  }

  @override
  Stream<Result<List<Note>, NoteException>> getNotes() {
    throw UnimplementedError();
  }

  @override
  Future<void> insertNote(Note note) {
    throw UnimplementedError();
  }
}
