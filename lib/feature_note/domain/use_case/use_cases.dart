import 'package:notesappflutter/feature_note/domain/use_case/add_note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/delete_note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/get_note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/get_notes.dart';
import 'package:notesappflutter/feature_note/domain/use_case/save_note.dart';

class NoteUseCases {
  final GetNotes getNotes;
  final DeleteNote deleteNote;
  final AddNote updateNote;
  final GetNote getNote;
  final SaveNote saveNote;

  NoteUseCases({
    required this.getNotes,
    required this.deleteNote,
    required this.updateNote,
    required this.getNote,
    required this.saveNote,
  });
}
