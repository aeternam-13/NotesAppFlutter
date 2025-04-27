import 'package:notesappflutter/feature_note/domain/model/note.dart';

abstract class NoteDao {
  Future<List<Note>> getNotes();

  Future<Note?> getNoteById(int id);

  Future<void> insertNote(Note note);

  Future<void> deleteNote(Note note);
}
