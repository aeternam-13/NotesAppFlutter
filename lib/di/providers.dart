import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/feature_note/data/data_source/note_dao.dart';
import 'package:notesappflutter/feature_note/data/repository/note_repository_impl.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/repository/note_repository.dart';
import 'package:notesappflutter/feature_note/presentation/notes/notes_viewmodel.dart';

final noteVMProvider = StateNotifierProvider<NoteViewModel, List<Note>>((ref) {
  final repository = ref.read(noteRepProvider);
  return NoteViewModel(repository);
});

final noteRepProvider = Provider<NoteRepository>((ref) {
  final noteDao = NoteDao();
  return NoteRepositoryImpl(noteDao);
});
