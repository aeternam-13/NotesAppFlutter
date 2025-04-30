import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/use_case/use_cases.dart';
import 'package:notesappflutter/feature_note/presentation/add_edit_note/add_edit_note_state.dart';

class AddEditNoteViewModel extends StateNotifier<AddEditNoteState> {
  final NoteUseCases _useCases;

  AddEditNoteViewModel(this._useCases) : super(AddEditNoteState());
}
