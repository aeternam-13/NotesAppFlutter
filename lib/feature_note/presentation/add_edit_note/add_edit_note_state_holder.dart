import 'package:dart_mappable/dart_mappable.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/note_text_field_state.dart';

part 'add_edit_note_state_holder.mapper.dart';

@MappableClass()
class AddEditNoteStateHolder with AddEditNoteStateHolderMappable {
  final NoteTextFieldState noteTitle;
  final NoteTextFieldState noteContent;
  final int noteColor;
  final int currentNoteId;

  AddEditNoteStateHolder({
    this.noteTitle = const NoteTextFieldState(hint: "Enter title"),
    this.noteContent = const NoteTextFieldState(hint: "Enter some content"),
    int? noteColor,
    this.currentNoteId = -1,
  }) : noteColor = noteColor ?? Note.randomColor();
}
