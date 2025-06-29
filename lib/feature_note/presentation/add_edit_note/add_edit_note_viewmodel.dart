import 'dart:async';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/use_cases.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_intent.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_state.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_state_holder.dart';

class AddEditNoteViewModel extends StateNotifier<AddEditNoteState> {
  final NoteUseCases _useCases;
  var _stateHolder = AddEditNoteStateHolder();

  AddEditNoteViewModel(this._useCases) : super(AddEditNoteLoadingState());

  final _uiEventController = StreamController<AddEditNoteUiEvent>.broadcast();

  Stream<AddEditNoteUiEvent> get uiEventStream => _uiEventController.stream;

  void onEvent(AddEditNoteIntent event) async {
    switch (event) {
      case EnteredTitleIntent():
        _stateHolder = _stateHolder.copyWith(
          noteTitle: _stateHolder.noteTitle.copyWith(text: event.value),
        );
        state = EditingNoteState(stateHolder: _stateHolder);
      case EnteredContentIntent():
        _stateHolder = _stateHolder.copyWith(
          noteContent: _stateHolder.noteContent.copyWith(text: event.value),
        );
        state = EditingNoteState(stateHolder: _stateHolder);
      case ChangeNoteColorIntent():
        _stateHolder = _stateHolder.copyWith(noteColor: event.color);
        state = EditingNoteState(stateHolder: _stateHolder);
      case SaveNoteIntent():
        int timestamp = _getTimestamp();
        log(timestamp.toString());
        try {
          await _useCases.addNote(
            Note(
              title: _stateHolder.noteTitle.text,
              content: _stateHolder.noteContent.text,
              timestamp: timestamp,
              color: _stateHolder.noteColor,
              id: _stateHolder.currentNoteId,
            ),
          );
          _uiEventController.add(SavedNote());
          _stateHolder = AddEditNoteStateHolder();
        } on InvalidNoteException catch (e) {
          _uiEventController.add(ShowSnackBar(message: e.message));
        } catch (e) {
          log("Error ${e.toString()}");
        }
    }
  }

  Future<void> loadNote(int noteId) async {
    if (noteId != -1) {
      final note = await _useCases.getNote(noteId);
      if (note != null) {
        _stateHolder = _stateHolder.copyWith(
          noteTitle: _stateHolder.noteTitle.copyWith(text: note.title),
          noteContent: _stateHolder.noteContent.copyWith(text: note.content),
          noteColor: note.color,
          currentNoteId: note.id,
        );
      }
    }

    state = EditingNoteState(stateHolder: _stateHolder);
  }
}

int _getTimestamp() {
  DateTime dateTime = DateTime.now();
  final formatted =
      '${dateTime.year.toString().padLeft(4, '0')}'
      '${dateTime.month.toString().padLeft(2, '0')}'
      '${dateTime.day.toString().padLeft(2, '0')}'
      '${dateTime.hour.toString().padLeft(2, '0')}'
      '${dateTime.minute.toString().padLeft(2, '0')}'
      '${dateTime.second.toString().padLeft(2, '0')}'
      '${dateTime.millisecond.toString().padLeft(3, '0').substring(0, 2)}';
  return int.parse(formatted);
}

sealed class AddEditNoteUiEvent {}

class SavedNote extends AddEditNoteUiEvent {}

class ShowSnackBar extends AddEditNoteUiEvent {
  final String message;

  ShowSnackBar({required this.message});
}
