import 'dart:async';
import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/use_cases.dart';
import 'package:notesappflutter/feature_note/domain/use_case/util/note_order.dart';
import 'package:notesappflutter/feature_note/domain/use_case/util/order_type.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_event.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_state.dart';

class NoteViewModel extends StateNotifier<NotesState> {
  final NoteUseCases _useCases;
  StreamSubscription<List<Note>>? _noteStream;
  Note? _recentlyDeletedNote;

  NoteViewModel(this._useCases) : super(NotesState()) {
    _getNotes(const NoteOrderDate(Descending()));
  }

  void onEvent(NotesEvent event) {
    switch (event) {
      case NotesEventOrder(noteOrder: var noteOrder):
        if (state.noteOrder.runtimeType == noteOrder.runtimeType &&
            state.noteOrder.orderType == noteOrder.orderType) {
          return;
        }
        _getNotes(noteOrder);

      case NotesEventDeleteNote(note: var note):
        _useCases.deleteNote(note.id);
        _recentlyDeletedNote = note;

      case NotesEventRestoreNote():
        if (_recentlyDeletedNote != null) {
          _useCases.addNote(_recentlyDeletedNote!);
          _recentlyDeletedNote = null;
        }

      case NotesEventToggleOrderSection():
        state = state.copyWith(
          isOrderSectionVisible: !state.isOrderSectionVisible,
        );
    }
  }

  void _getNotes(NoteOrder noteOrder) {
    _noteStream?.cancel();
    _noteStream = _useCases
        .getNotes(noteOrder: noteOrder)
        .listen(
          (notes) => state = state.copyWith(notes: notes, noteOrder: noteOrder),
          onError: (error) => log(error),
        );
  }

  @override
  void dispose() {
    _noteStream?.cancel();
    super.dispose();
  }
}
