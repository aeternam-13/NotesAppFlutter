import 'package:notesappflutter/feature_note/domain/model/storage_mode.dart';
import 'package:notesappflutter/feature_note/domain/use_case/add_note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/delete_note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/get_note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/get_notes.dart';
import 'package:notesappflutter/feature_note/domain/use_case/save_note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/switch_storage_mode.dart';

class NoteUseCases {
  final GetNotes getNotes;
  final DeleteNote deleteNote;
  final AddNote updateNote;
  final GetNote getNote;
  final SaveNote saveNote;
  final StorageMode Function() getStorageMode;
  final SwitchStorageMode switchStorageMode;

  NoteUseCases({
    required this.getNotes,
    required this.deleteNote,
    required this.updateNote,
    required this.getNote,
    required this.saveNote,
    required this.getStorageMode,
    required this.switchStorageMode,
  });
}
