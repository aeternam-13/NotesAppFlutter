import 'package:hive_ce/hive.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';

class NoteDao {
  final Box _box = Hive.box('notesBox');

  Future<List<Note>> getNotes() async {
    final notes = <Note>[];
    for (final key in _box.keys) {
      final map = await _box.get(key);
      if (map != null) {
        notes.add(NoteMapper.fromMap(Map<String, dynamic>.from(map)));
      }
    }
    return notes;
  }

  Future<Note?> getNoteById(int id) async {
    final map = await _box.get(id.toString());
    if (map != null) {
      return NoteMapper.fromMap(Map<String, dynamic>.from(map));
    }
    return null;
  }

  Future<void> insertNote(Note note) async {
    await _box.put(note.id.toString(), note.toMap());
  }

  Future<void> deleteNote(Note note) async {
    await _box.delete(note.id.toString());
  }
}
