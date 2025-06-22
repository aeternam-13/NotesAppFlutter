import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/feature_note/data/data_source/note_dao.dart';
import 'package:notesappflutter/feature_note/data/data_source/note_dao_hive.dart';
import 'package:notesappflutter/feature_note/data/repository/note_repository_impl.dart';
import 'package:notesappflutter/feature_note/domain/repository/note_repository.dart';
import 'package:notesappflutter/feature_note/domain/use_case/add_note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/delete_note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/get_note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/get_notes.dart';
import 'package:notesappflutter/feature_note/domain/use_case/use_cases.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_state.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_viewmodel.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_state.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_viewmodel.dart';

final noteVMProvider = StateNotifierProvider<NoteViewModel, NotesState>((ref) {
  final useCases = ref.read(useCasesProvider);
  return NoteViewModel(useCases);
});

final addEditNoteVMProvider =
    StateNotifierProvider<AddEditNoteViewModel, AddEditNoteState>((ref) {
      final useCases = ref.read(useCasesProvider);
      return AddEditNoteViewModel(useCases);
    });

final addEditNoteUiEventProvider = StreamProvider<AddEditNoteUiEvent>(
  (ref) => ref.watch(addEditNoteVMProvider.notifier).uiEventStream,
);

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

final noteDaoProvider = Provider<NoteDao>((ref) => NoteDaoHive());
