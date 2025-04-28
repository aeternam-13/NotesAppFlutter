import 'package:notesappflutter/feature_note/domain/repository/note_repository.dart';

class DeleteNote {
  final NoteRepository repository;

  DeleteNote(this.repository);

  Future<void> call(int id) async {
    await repository.deleteNote(id);
  }
}
