import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/repository/note_repository.dart';

class AddEditNoteViewModel extends StateNotifier<List<Note>> {
  final NoteRepository _noteRepository;

  AddEditNoteViewModel(this._noteRepository) : super([]) {}
}
