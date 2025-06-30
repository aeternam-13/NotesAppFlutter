import 'package:multiple_result/multiple_result.dart';
import 'package:notesappflutter/feature_note/domain/model/note_exception.dart';
import 'package:notesappflutter/feature_note/domain/repository/note_repository.dart';

class DeleteNote {
  final NoteRepository repository;

  DeleteNote(this.repository);

  Future<Result<Unit, NoteException>> call(int id) async {
    return await repository.deleteNote(id);
  }
}
