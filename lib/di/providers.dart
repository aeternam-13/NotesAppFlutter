import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/feature_note/data/data_source/note_dao.dart';
import 'package:notesappflutter/feature_note/data/data_source/note_dao_hive.dart';
import 'package:notesappflutter/feature_note/data/repository/note_repository_impl.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/repository/note_repository.dart';
import 'package:notesappflutter/feature_note/domain/use_case/add_note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/delete_note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/get_note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/get_notes.dart';
import 'package:notesappflutter/feature_note/domain/use_case/use_cases.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_viewmodel.dart';

final noteVMProvider = StateNotifierProvider<NoteViewModel, List<Note>>((ref) {
  final useCases = ref.read(useCasesProvider);
  return NoteViewModel(useCases);
});

final useCasesProvider = Provider<NoteUseCases>((ref) {
  final repository = ref.read(noteRepProvider);
  return NoteUseCases(
    getNotes: GetNotes(repository),
    deleteNote: DeleteNote(repository),
    addNote: AddNote(repository),
    getNote: GetNote(repository),
  );
});

final noteRepProvider = Provider<NoteRepository>((ref) {
  final dao = ref.read(noteDaoProvider);
  return NoteRepositoryImpl(dao);
});

final noteDaoProvider = Provider<NoteDao>((ref) {
  return NoteDaoHive();
});
