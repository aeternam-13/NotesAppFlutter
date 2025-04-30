import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/util/note_order.dart';

sealed class NotesEvent {}

class EventOrder extends NotesEvent {
  final NoteOrder noteOrder;

  EventOrder(this.noteOrder);
}

class EventDeleteNote extends NotesEvent {
  final Note note;

  EventDeleteNote(this.note);
}

class EventRestoreNote extends NotesEvent {}

class EventToggleOrderSection extends NotesEvent {}
