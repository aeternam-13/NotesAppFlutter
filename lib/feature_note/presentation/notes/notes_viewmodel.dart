import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/repository/note_repository.dart';

class NoteViewModel extends StateNotifier<List<Note>> {
  final NoteRepository _noteRepository;

  NoteViewModel(this._noteRepository) : super([]) {
    loadNotes();
  }

  Future<void> loadNotes() async {
    final notes = await _noteRepository.getNotes();
    state = notes;
  }

  Future<void> insertNote(Note note) async {
    await _noteRepository.insertNote(note);
    loadNotes();
  }

  Future<void> deleteNote(Note note) async {
    await _noteRepository.deleteNote(note.id);
    loadNotes();
  }
}
