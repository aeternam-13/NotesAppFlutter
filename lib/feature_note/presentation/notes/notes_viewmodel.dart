import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/use_cases.dart';

class NoteViewModel extends StateNotifier<List<Note>> {
  final NoteUseCases _useCases;
  late final StreamSubscription<List<Note>> _noteStream;

  NoteViewModel(this._useCases) : super([]) {
    _listenToNotes();
  }

  void _listenToNotes() {
    _noteStream = _useCases.getNotes().listen((newNotes) => state = newNotes);
  }

  Future<void> insertNote(Note note) async => await _useCases.addNote(note);

  Future<void> deleteNote(int id) async => await _useCases.deleteNote(id);

  @override
  void dispose() {
    _noteStream.cancel();
    super.dispose();
  }
}
