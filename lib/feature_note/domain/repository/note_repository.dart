import 'package:notesappflutter/feature_note/domain/model/note.dart';

abstract class NoteRepository {
  Stream<List<Note>> getNotes();

  Future<Note?> getNoteById(int id);

  Future<void> insertNote(Note note);

  Future<void> deleteNote(int id);
}
