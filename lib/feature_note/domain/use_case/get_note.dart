import 'package:notesappflutter/feature_note/domain/model/note.dart';
import 'package:notesappflutter/feature_note/domain/repository/note_repository.dart';

class GetNote {
  final NoteRepository _repository;

  const GetNote(this._repository);

  Future<Note?> call(int id) async {
    return await _repository.getNoteById(id);
  }
}
