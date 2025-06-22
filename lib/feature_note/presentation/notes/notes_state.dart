import 'package:notesappflutter/feature_note/domain/model/note_exception.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_state_holder.dart';

sealed class NotesState {}

class NotesStateSuccess extends NotesState {
  final NotesStateHolder state;

  NotesStateSuccess({required this.state});
}

class NotesStateError extends NotesState {
  final NoteException exception;

  NotesStateError({required this.exception});
}

class NotesStateLoading extends NotesState {}
