import 'package:multiple_result/multiple_result.dart';
import 'package:notesappflutter/feature_note/domain/model/note_exception.dart';
import 'package:notesappflutter/feature_note/domain/repository/note_repository.dart';

class DeleteNote {
  final NoteRepository _repository;

  DeleteNote(this._repository);

  Future<Result<Unit, NoteException>> call(int id) async {
    return await _repository.deleteNote(id);
  }
}
