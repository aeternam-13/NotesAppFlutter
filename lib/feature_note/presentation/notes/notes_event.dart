import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/util/note_order.dart';

sealed class NotesEvent {}

class NotesEventOrder extends NotesEvent {
  final NoteOrder noteOrder;

  NotesEventOrder(this.noteOrder);
}

class NotesEventDeleteNote extends NotesEvent {
  final Note note;

  NotesEventDeleteNote(this.note);
}

class NotesEventRestoreNote extends NotesEvent {}

class NotesEventToggleOrderSection extends NotesEvent {}
