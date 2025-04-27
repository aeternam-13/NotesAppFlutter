import 'package:hive_ce/hive.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';

class NoteDao {
  final Box _box = Hive.box('notesBox');

  Future<List<Note>> getNotes() async {
    final notes = <Note>[];
    for (final key in _box.keys) {
      final note = await _box.get(key);
      if (note != null) notes.add(note);
    }
    return notes;
  }

  Future<Note?> getNoteById(int id) async {
    return await _box.get(id);
  }

  Future<void> insertNote(Note note) async {
    await _box.put(note.id, note);
  }

  Future<void> deleteNote(int id) async {
    await _box.delete(id);
  }
}
