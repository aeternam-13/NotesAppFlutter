import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/util/note_order.dart';

sealed class NotesIntent {}

class OrderIntent extends NotesIntent {
  final NoteOrder noteOrder;

  OrderIntent(this.noteOrder);
}

class DeleteNoteIntent extends NotesIntent {
  final Note note;

  DeleteNoteIntent(this.note);
}

class RestoreNoteIntent extends NotesIntent {}

class ToggleOrderSectionIntent extends NotesIntent {}

class GoToAddEditNoteIntent extends NotesIntent {
  final int noteId;

  GoToAddEditNoteIntent({this.noteId = -1});
}
