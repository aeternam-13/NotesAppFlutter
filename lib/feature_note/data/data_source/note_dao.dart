import 'package:floor/floor.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';

@dao
abstract class NoteDao {
  @Query("SELECT * FROM note")
  Stream<List<Note>> getNotes();

  @Query("SELECT * FROM note WHERE id = :id")
  Future<Note?> getNoteById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertNote(Note note);

  @delete
  Future<void> deleteNote(Note note);
}
