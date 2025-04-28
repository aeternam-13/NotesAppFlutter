import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/use_cases.dart';

class NoteViewModel extends StateNotifier<List<Note>> {
  final NoteUseCases _useCases;

  NoteViewModel(this._useCases) : super([]) {
    loadNotes();
  }

  Future<void> loadNotes() async {
    final notes = await _useCases.getNotes();
    state = notes;
  }

  Future<void> insertNote(Note note) async {
    await _useCases.addNote(note);
    loadNotes();
  }

  Future<void> deleteNote(Note note) async {
    await _useCases.deleteNote(note.id);
    loadNotes();
  }
}
