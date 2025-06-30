import 'dart:async';
import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/model/note_exception.dart';
import 'package:notesappflutter/feature_note/domain/use_case/use_cases.dart';
import 'package:notesappflutter/feature_note/domain/use_case/util/note_order.dart';
import 'package:notesappflutter/feature_note/domain/use_case/util/order_type.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_intent.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_state.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_state_holder.dart';

class NoteViewModel extends StateNotifier<NotesState> {
  final NoteUseCases _useCases;
  StreamSubscription<Result<List<Note>, NoteException>>? _noteStream;
  Note? _recentlyDeletedNote;
  var _state = NotesStateHolder();

  final _uiEventController = StreamController<NotesScreenUiEvent>.broadcast();

  Stream<NotesScreenUiEvent> get uiEventStream => _uiEventController.stream;

  NoteViewModel(this._useCases) : super(NotesStateLoading()) {
    _getNotes(const NoteOrderDate(Descending()));
  }

  void onIntent(NotesIntent event) {
    switch (event) {
      case OrderIntent():
        if (_state.noteOrder.runtimeType == event.noteOrder.runtimeType &&
            _state.noteOrder.orderType == event.noteOrder.orderType) {
          return;
        }
        _getNotes(event.noteOrder);

      case DeleteNoteIntent(note: var note):
        _useCases.deleteNote(note.id);
        _recentlyDeletedNote = note;
        _uiEventController.add(
          ShowSnackBarWithUndo(
            message: "Note deleted",
            undoCallback: () => onIntent(RestoreNoteIntent()),
          ),
        );

      case RestoreNoteIntent():
        if (_recentlyDeletedNote != null) {
          _useCases.addNote(_recentlyDeletedNote!);
          _recentlyDeletedNote = null;
        }

      case ToggleOrderSectionIntent():
        _state = _state.copyWith(
          isOrderSectionVisible: !_state.isOrderSectionVisible,
        );
        state = NotesStateSuccess(state: _state);

      case GoToAddEditNoteIntent():
        _uiEventController.add(NavigateToAddEditNote(noteId: event.noteId));

      case GetNotesIntent():
        _getNotes(_state.noteOrder);
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
  final VoidCallback undoCallback;

  ShowSnackBarWithUndo({required this.message, required this.undoCallback});
}

class NavigateToAddEditNote extends NotesScreenUiEvent {
  final int noteId;

  NavigateToAddEditNote({required this.noteId});
}
