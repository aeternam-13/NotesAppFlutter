import 'package:hive_ce/hive.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:notesappflutter/feature_note/data/data_source/note_dao.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/model/note_exception.dart';

class NoteDaoHive implements NoteDao {
  final Box _box = Hive.box('notesBox');

  List<Note> _readAllNotes() {
    final notes = <Note>[];
    for (final key in _box.keys) {
      final note = _box.get(key);
      if (note != null) notes.add(note);
    }
    return notes;
  }

  @override
  Stream<Result<List<Note>, NoteException>> getNotes() async* {
    yield Success(_readAllNotes());
    yield* _box.watch().map((_) => Success(_readAllNotes()));
  }

  @override
  Future<Note?> getNoteById(int id) async {
    return await _box.get(id);
  }

  //TODO replace for uuid
  @override
  Future<void> insertNote(Note note) async {
    if (note.id == -1) {
      final key = await _box.add(note);
      Note noteCopy = note.copyWith(id: key);
      await _box.put(key, noteCopy);
      return;
    }

    await _box.put(note.id, note);
  }

  @override
  Future<void> deleteNote(int id) async {
    await _box.delete(id);
  }
}
