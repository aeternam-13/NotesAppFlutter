import 'package:notesappflutter/feature_note/domain/use_case/add_note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/delete_note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/get_note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/get_notes.dart';

class NoteUseCases {
  final GetNotes getNotes;
  final DeleteNote deleteNote;
  final AddNote addNote;
  final GetNote getNote;

  NoteUseCases({
    required this.getNotes,
    required this.deleteNote,
    required this.addNote,
    required this.getNote,
  });
}
