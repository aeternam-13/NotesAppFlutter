import 'dart:async';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/use_cases.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_state.dart';

class AddEditNoteViewModel extends StateNotifier<AddEditNoteState> {
  final NoteUseCases _useCases;

  AddEditNoteViewModel(this._useCases) : super(AddEditNoteState());

  final _uiEventController = StreamController<AddEditNoteUiEvent>.broadcast();

  Stream<AddEditNoteUiEvent> get uiEventStream => _uiEventController.stream;

  void onEvent(AddEditNoteEvent event) async {
    switch (event) {
      case EnteredTitle():
        state = state.copyWith(
          noteTitle: state.noteTitle.copyWith(text: event.value),
        );
      case EnteredContent():
        state = state.copyWith(
          noteContent: state.noteContent.copyWith(text: event.value),
        );
      case ChangeColor():
        state = state.copyWith(noteColor: event.color);
      case SaveNote():
        int timestamp = _getTimestamp();
        log(timestamp.toString());
        try {
          await _useCases.addNote(
            Note(
              title: state.noteTitle.text,
              content: state.noteContent.text,
              timestamp: timestamp,
              color: state.noteColor,
              id: state.currentNoteId,
            ),
          );
          _uiEventController.add(SavedNote());
          state = AddEditNoteState();
          log(state.noteColor.toString());
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
        state = state.copyWith(
          noteTitle: state.noteTitle.copyWith(text: note.title),
          noteContent: state.noteContent.copyWith(text: note.content),
          noteColor: note.color,
          currentNoteId: note.id,
        );
      }
    }
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
