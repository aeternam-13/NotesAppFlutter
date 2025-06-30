import 'package:multiple_result/multiple_result.dart';
import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/model/note_exception.dart';
import 'package:notesappflutter/feature_note/domain/repository/note_repository.dart';

class SaveNote {
  final NoteRepository _repository;

  SaveNote(this._repository);

  Future<Result<Unit, NoteException>> call(Note note) async {
    if (note.title.trim().isEmpty) {
      return Error(InvalidNoteException("Title can't be empty"));
    }
    if (note.content.trim().isEmpty) {
      return Error(InvalidNoteException('Content is empty'));
    }

    return await _repository.saveNote(note);
  }
}
