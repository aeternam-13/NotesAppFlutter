import 'package:dart_mappable/dart_mappable.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/note_text_field_state.dart';

part 'add_edit_note_state.mapper.dart';

@MappableClass()
class AddEditNoteState with AddEditNoteStateMappable {
  final NoteTextFieldState noteTitle;
  final NoteTextFieldState noteContent;
  final int noteColor;
  final int currentNoteId;

  AddEditNoteState({
    this.noteTitle = const NoteTextFieldState(),
    this.noteContent = const NoteTextFieldState(),
    int? noteColor,
    this.currentNoteId = -1,
  }) : noteColor = noteColor ?? Note.randomColor();
}
