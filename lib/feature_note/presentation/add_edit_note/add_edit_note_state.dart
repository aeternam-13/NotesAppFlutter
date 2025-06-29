import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_state_holder.dart';

sealed class AddEditNoteState {}

class EditingNoteState extends AddEditNoteState {
  final AddEditNoteStateHolder stateHolder;

  EditingNoteState({required this.stateHolder});
}

class AddEditNoteLoadingState extends AddEditNoteState {}
