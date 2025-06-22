import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/model/note_exception.dart';
import 'package:notesappflutter/feature_note/domain/use_case/use_cases.dart';
import 'package:notesappflutter/feature_note/domain/use_case/util/note_order.dart';
import 'package:notesappflutter/feature_note/domain/use_case/util/order_type.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_viewmodel.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_event.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_state.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_state_holder.dart';

class NoteViewModel extends StateNotifier<NotesState> {
  final NoteUseCases _useCases;
  StreamSubscription<Result<List<Note>, NoteException>>? _noteStream;
  Note? _recentlyDeletedNote;
  var _state = NotesStateHolder();

  final _uiEventController = StreamController<AddEditNoteUiEvent>.broadcast();

  Stream<AddEditNoteUiEvent> get uiEventStream => _uiEventController.stream;

  NoteViewModel(this._useCases) : super(NotesStateLoading()) {
    _getNotes(const NoteOrderDate(Descending()));
  }

  void onEvent(NotesEvent event) {
    switch (event) {
      case EventOrder():
        if (_state.noteOrder.runtimeType == event.noteOrder.runtimeType &&
            _state.noteOrder.orderType == event.noteOrder.orderType) {
          return;
        }
        _getNotes(event.noteOrder);

      case EventDeleteNote(note: var note):
        _useCases.deleteNote(note.id);
        _recentlyDeletedNote = note;

      case EventRestoreNote():
        if (_recentlyDeletedNote != null) {
          _useCases.addNote(_recentlyDeletedNote!);
          _recentlyDeletedNote = null;
        }

      case EventToggleOrderSection():
        _state = _state.copyWith(
          isOrderSectionVisible: !_state.isOrderSectionVisible,
        );
        state = NotesStateSuccess(state: _state);
    }
  }

  void _getNotes(NoteOrder noteOrder) {
    _noteStream?.cancel();
    state = NotesStateLoading();
    _noteStream = _useCases.getNotes(noteOrder: noteOrder).listen(
      (result) {
        result.map(
          successMapper: (notes) {
            _state = _state.copyWith(notes: notes, noteOrder: noteOrder);
            state = NotesStateSuccess(state: _state);
          },
          errorMapper:
              (exception) => state = NotesStateError(exception: exception),
        );
      },
      onError:
          (error) =>
              NotesStateError(exception: NoteStreamException(error.toString())),
    );
  }

  @override
  void dispose() {
    _noteStream?.cancel();
    super.dispose();
  }
}

sealed class NotesScreenUiEvent {}

class ShowSnackBarWithUndo extends NotesScreenUiEvent {
  final String message;
  final Function undoCallback;

  ShowSnackBarWithUndo({required this.message, required this.undoCallback});
}
